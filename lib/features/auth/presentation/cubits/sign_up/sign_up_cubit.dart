import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/features/auth/presentation/cubits/sign_up/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpInitial());
  bool isPassword = true;
  bool isConfirmPassVisible = true;

  void switchPassVisibility() {
    isPassword = !isPassword;
    emit(SignUpChangePasswordVisibility(isPassword: isPassword));
  }

  void switchConfirmPassVisibility() {
    isConfirmPassVisible = !isConfirmPassVisible;
    emit(SignUpChangePasswordVisibility(isPassword: isConfirmPassVisible));
  }
}
