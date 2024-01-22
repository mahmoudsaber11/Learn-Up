import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_up/features/onBoarding/data/model/on_boarding_model.dart';
import 'package:learn_up/features/onBoarding/data/repositories/on_boarding_repo.dart';
import 'package:learn_up/features/onBoarding/presentation/cubit/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit({required this.onBoardingRepo})
      : super(const OnBoardingInitial());

  final OnBoardingRepo onBoardingRepo;
  bool isLastBoarding = false;
  List<OnBoardingModel> onBoardingPages() {
    return onBoardingRepo.onBoardingPages();
  }

  void onChangePageIndex(int index) {
    if (index == onBoardingPages().length - 1) {
      isLastBoarding = true;
    } else {
      isLastBoarding = false;
    }
    emit(PageViewIndexChanged(index: index));
  }

  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
  }) {
    onBoardingRepo.navigateBetweenPages(
        context: context,
        pageController: pageController,
        isLastBoarding: isLastBoarding);
    emit(const NavigateBetweenPages());
  }

  void skipToLogin({required BuildContext context}) {
    onBoardingRepo.skipToLogin(context: context);

    emit(const SkipToLogin());
  }
}
