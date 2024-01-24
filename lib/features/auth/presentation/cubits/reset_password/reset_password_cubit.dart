import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/features/auth/presentation/cubits/reset_password/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super((const ResetPasswordInitial()));

  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;

    emit(ChangeVisibility(isPassword: isPassword));
  }
}
