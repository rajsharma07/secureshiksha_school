import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:secureshiksha_school/bloc/generate_report/generate_report_event.dart';
import 'package:secureshiksha_school/bloc/generate_report/generate_report_state.dart';
import 'package:http/http.dart' as http;
import 'package:secureshiksha_school/core/constants.dart';
import 'package:secureshiksha_school/core/shared_objects.dart';
import 'package:share_plus/share_plus.dart';

class GenerateReportBloc
    extends Bloc<GenerateReportEvent, GenerateReportState> {
  GenerateReportBloc() : super(InitialState()) {
    on<GetReportEvent>(
      (event, emit) async {
        emit(
          FetchingData(),
        );
        try {
          final String token = await secureStorage.getToken() ?? "";
          //getting response
          final response = await http.get(
            Uri.parse(
              "${serverUrl}getAllAttendanceLog/${event.first.year}-${event.first.month}-${event.first.day}/${event.last.year}-${event.last.month}-${event.last.day}",
            ),
            headers: {
              "Authorization": token,
              "Content-Type": "application/json"
            },
          );

          if (response.statusCode == 200) {
            emit(GeneratingReport());

            final dir = await getApplicationCacheDirectory();

            //generating file path
            final filePath =
                "${dir.path}/attendance_report_${event.first.year}_${event.first.month}_${event.first.day}_${event.last.year}_${event.last.month}_${event.last.day}.csv";

            //creating file
            final file = File(filePath);
            await file.writeAsBytes(response.bodyBytes);
            emit(
              SuccessState(file),
            );
          } else {
            emit(
              FailureState(
                jsonDecode(response.body)['message'],
              ),
            );
          }
        } catch (error) {
          emit(FailureState("Something Went wrong"));
        }
      },
    );

    on<ShareReportEvent>(
      (event, emit) {
        final f = XFile(event.file.path);
        Share.shareXFiles(
          [f],
          text: "Attendance Report",
        );
      },
    );
  }
}
