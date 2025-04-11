import 'package:secureshiksha_school/model/attendance_model.dart';

abstract class ViewAttendanceState {}

class Loading extends ViewAttendanceState {}

class Successful extends ViewAttendanceState {
  final List<AttendanceModel> attendanceList;
  Successful(
    this.attendanceList,
  );
}

class InitialState extends ViewAttendanceState {}

class FailureState extends ViewAttendanceState {
  String? message;
  FailureState(this.message);
}
