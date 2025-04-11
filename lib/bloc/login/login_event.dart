import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Login extends LoginEvent {
  final String id;
  final String password;
  Login({required this.id, required this.password});
}

class LogOut extends LoginEvent {}

class InitializeEvent extends LoginEvent {}
