import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_event.dart';
import 'package:secureshiksha_school/bloc/attendance/view_attendance/view_attendance_state.dart';
import 'package:secureshiksha_school/core/http_requests/get_request.dart';
import 'package:secureshiksha_school/model/attendance_model.dart';

class ViewAttendanceBloc
    extends Bloc<ViewAttendanceEvent, ViewAttendanceState> {
  ViewAttendanceBloc() : super(InitialState()) {
    on<GetAttendance>(
      (event, emit) async {
        emit(Loading());
        final result = await GetRequest.request(
          "getAttendance/${event.dateTime.year}-${event.dateTime.month}-${event.dateTime.day}",
        );
        result.fold(
          (l) {
            final List list = l;
            final attendanceRecords = list.map(
              (e) {
                return AttendanceModel.fromJson(e);
              },
            ).toList();
            emit(
              Successful(attendanceRecords),
            );
          },
          (r) {
            emit(
              FailureState(r.message),
            );
          },
        );
      },
    );

    on<GetStudentAttnednace>(
      (event, emit) async {
        emit(Loading());
        final result = await GetRequest.request(
          "getStudentAttendance/${event.rollNumber}/${event.first.year}-${event.first.month}-${event.first.day}/${event.last.year}-${event.last.month}-${event.last.day}",
        );
        result.fold(
          (l) {
            final List templ = l;
            final List<AttendanceModel> list = templ.map(
              (e) {
                return AttendanceModel.fromJson(e);
              },
            ).toList();
            emit(Successful(list));
          },
          (r) {
            emit(FailureState(r.message));
          },
        );
      },
    );
  }
}
