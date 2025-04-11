abstract class ChangePasswordState {}

class Loading extends ChangePasswordState {}

class Successful extends ChangePasswordState {}

class InitialState extends ChangePasswordState {}

class FailureState extends ChangePasswordState {
  String? message;
  FailureState(this.message);
}
