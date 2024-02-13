import 'package:equatable/equatable.dart';
import 'package:learn_up/features/auth/data/models/user.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

class SignUpLoading extends SignUpState {
  const SignUpLoading();
}

class SignUpSuccess extends SignUpState {
  final String uId;
  final User user;

  const SignUpSuccess({required this.user, required this.uId});

  @override
  List<Object?> get props => [user, uId];
}

class SignUpError extends SignUpState {
  final String error;

  const SignUpError({required this.error});

  @override
  List<Object?> get props => [error];
}

class SignUpChangePasswordVisibility extends SignUpState {
  final bool isPassword;

  const SignUpChangePasswordVisibility({required this.isPassword});

  @override
  List<Object?> get props => [isPassword];
}
