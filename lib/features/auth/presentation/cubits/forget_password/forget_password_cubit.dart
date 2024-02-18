import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/features/auth/data/repositories/forgot_password/forgot_password_repo.dart';
import 'package:learn_up/features/auth/presentation/cubits/forget_password/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.forgetPasswordRepo})
      : super(const ForgetPasswordInitial());
  final ForgetPasswordRepo forgetPasswordRepo;

  void forgetPassword({required String email}) {
    emit(const ForgetPasswordLoading());
    forgetPasswordRepo.forgetPassword(email: email).then((value) {
      value.fold((failure) {
        emit(ForgetPasswordError(error: failure.errMessage.toString()));
      }, (success) {
        emit(const ForgetPasswordSuccess());
      });
    });
  }
}
