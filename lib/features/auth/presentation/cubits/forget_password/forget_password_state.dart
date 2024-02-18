import 'package:equatable/equatable.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
  @override
  List<Object?> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {
  const ForgetPasswordInitial();
}

class ForgetPasswordLoading extends ForgetPasswordState {
  const ForgetPasswordLoading();
}

class ForgetPasswordSuccess extends ForgetPasswordState {
  const ForgetPasswordSuccess();
}

class ForgetPasswordError extends ForgetPasswordState {
  final String error;

  const ForgetPasswordError({required this.error});
  @override
  List<Object?> get props => [error];
}
