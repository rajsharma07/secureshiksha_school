abstract class MarkAttendanceState {}

class Loading extends MarkAttendanceState {}

class Successful extends MarkAttendanceState {
  String rollNumber;
  bool inOut;
  Successful(this.rollNumber, this.inOut);
}

class InitialState extends MarkAttendanceState {
  String rollNumber;
  bool inOut;
  InitialState(this.rollNumber, this.inOut);
}

class FailureState extends MarkAttendanceState {
  String? message;

  FailureState(this.message);
}
