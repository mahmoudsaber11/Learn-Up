import 'package:equatable/equatable.dart';
import 'package:learn_up/features/auth/data/models/user.dart';

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

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final String uId;
  final User user;

  const LoginSuccess({required this.user, required this.uId});

  @override
  List<Object?> get props => [user, uId];
}

class LoginError extends LoginState {
  final String error;

  const LoginError({required this.error});

  @override
  List<Object?> get props => [error];
}
