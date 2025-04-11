import 'package:equatable/equatable.dart';

abstract class GetStudentsListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetStudentsList extends GetStudentsListEvent {
  final String stdDiv;
  GetStudentsList(this.stdDiv);
}
