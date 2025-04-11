import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/mark_attendance/mark_attendance_event.dart';
import 'package:secureshiksha_school/bloc/attendance/mark_attendance/mark_attendance_state.dart';
import 'package:secureshiksha_school/core/http_requests/get_request.dart';
import 'package:secureshiksha_school/core/http_requests/post_request.dart';

class MarkAttendanceBloc
    extends Bloc<MarkAttendanceEvent, MarkAttendanceState> {
  MarkAttendanceBloc(String rollNumber, bool inOut)
      : super(InitialState(
          rollNumber,
          inOut,
        )) {
    on<MarkAttedance>(
      (event, emit) async {
        emit(
          Loading(),
        );
        final result = await PostRequest.request(
          "markAttendance",
          {
            "rollNumber": event.rollNumber,
            "inOut": !event.inOut,
            "dateTime": DateTime.now().toString()
          },
        );
        result.fold(
          (l) {
            emit(
              Successful(
                event.rollNumber,
                !event.inOut,
              ),
            );
          },
          (r) {
            emit(FailureState(
              r.message,
            ));
          },
        );
      },
    );

    on<RollBack>(
      (event, emit) async {
        emit(Loading());
        final result = await GetRequest.request(
            "getStudentCurrentStatus/${event.rollNumber}");
        result.fold(
          (l) {
            emit(
              InitialState(event.rollNumber, l['inOut'] == 1),
            );
          },
          (r) {
            emit(
              FailureState(
                r.message,
              ),
            );
          },
        );
      },
    );
  }
}
