import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

class SignUpChangePasswordVisibility extends SignUpState {
  final bool isPassword;

  const SignUpChangePasswordVisibility({required this.isPassword});

  @override
  List<Object?> get props => [isPassword];
}
