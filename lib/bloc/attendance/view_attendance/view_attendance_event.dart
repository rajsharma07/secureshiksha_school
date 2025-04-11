import 'package:equatable/equatable.dart';

abstract class ViewAttendanceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAttendance extends ViewAttendanceEvent {
  final DateTime dateTime;
  GetAttendance(this.dateTime);
}

class GetStudentAttnednace extends ViewAttendanceEvent {
  final String rollNumber;
  final DateTime first;
  final DateTime last;
  GetStudentAttnednace(this.rollNumber, this.first, this.last);
}
