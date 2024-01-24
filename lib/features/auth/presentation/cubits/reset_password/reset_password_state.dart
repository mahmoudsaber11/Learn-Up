import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object?> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial();
}

class ChangeVisibility extends ResetPasswordState {
  final bool isPassword;

  const ChangeVisibility({required this.isPassword});

  @override
  List<Object?> get props => [isPassword];
}
