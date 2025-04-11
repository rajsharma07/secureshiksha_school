import 'package:secureshiksha_school/model/student_model.dart';

abstract class GetStudentsListState {}

class Loading extends GetStudentsListState {}

class Successful extends GetStudentsListState {
  List<StudentModel> studentList;
  Successful(
    this.studentList,
  );
}

class InitialState extends GetStudentsListState {}

class FailureState extends GetStudentsListState {
  String? message;
  FailureState(this.message);
}
