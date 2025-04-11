import 'package:secureshiksha_school/model/school_model.dart';

abstract class ProfileState {}

class Loading extends ProfileState {}

class Successful extends ProfileState {
  SchoolModel schoolModel;
  Successful(this.schoolModel);
}

class InitialState extends ProfileState {}

class FailureState extends ProfileState {
  String? message;
  FailureState(this.message);
}
