import 'package:equatable/equatable.dart';

abstract class ChangePasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangePassword extends ChangePasswordEvent {
  final String newPassword;
  ChangePassword(this.newPassword);
}
