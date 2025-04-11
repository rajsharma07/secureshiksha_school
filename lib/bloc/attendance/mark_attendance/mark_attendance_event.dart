import 'package:equatable/equatable.dart';

abstract class MarkAttendanceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MarkAttedance extends MarkAttendanceEvent {
  final String rollNumber;
  final bool inOut;
  MarkAttedance(this.rollNumber, this.inOut);
}

class RollBack extends MarkAttendanceEvent {
  final String rollNumber;
  RollBack(this.rollNumber);
}
