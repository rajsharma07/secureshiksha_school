abstract class LoginState {}

class LoadingState extends LoginState {}

class LoggedOutState extends LoginState {}

class UninitilizedState extends LoginState {}

class FailureState extends LoginState {
  String message;
  FailureState(this.message);
}

class LoggedInState extends LoginState {}
