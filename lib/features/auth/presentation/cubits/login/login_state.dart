import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginChangePasswordVisibility extends LoginState {
  final bool isPassword;

  const LoginChangePasswordVisibility({required this.isPassword});

  @override
  List<Object?> get props => [isPassword];
}
