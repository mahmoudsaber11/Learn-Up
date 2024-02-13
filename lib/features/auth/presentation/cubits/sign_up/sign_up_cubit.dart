import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/features/auth/data/entities/sign_up_params.dart';
import 'package:learn_up/features/auth/data/repositories/sign_up/sign_up_repo.dart';
import 'package:learn_up/features/auth/presentation/cubits/sign_up/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpRepo}) : super(const SignUpInitial());
  final SignUpRepo signUpRepo;

  bool isPassword = true;
  bool isConfirmPassVisible = true;

  void userSignUp({
    required String email,
    required String username,
    required String password,
    required String confirmPassword,
    required String? profileImage,
  }) {
    emit(const SignUpLoading());
    signUpRepo
        .userSignUp(
      signUpParams: SignUpParams(
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          username: username,
          profileImage: profileImage),
    )
        .then((value) {
      value.fold((failure) {
        emit(SignUpError(error: failure.errMessage.toString()));
      }, (user) {
        emit(SignUpSuccess(user: user, uId: user.token));
      });
    });
  }

  void switchPassVisibility() {
    isPassword = !isPassword;
    emit(SignUpChangePasswordVisibility(isPassword: isPassword));
  }

  void switchConfirmPassVisibility() {
    isConfirmPassVisible = !isConfirmPassVisible;
    emit(SignUpChangePasswordVisibility(isPassword: isConfirmPassVisible));
  }
}
