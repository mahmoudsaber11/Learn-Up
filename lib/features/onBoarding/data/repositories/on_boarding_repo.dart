import 'package:flutter/material.dart';
import 'package:learn_up/features/onBoarding/data/model/on_boarding_model.dart';

abstract class OnBoardingRepo {
  List<OnBoardingModel> onBoardingPages();

  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
    required bool isLastBoarding,
  });

  void skipToLogin({required BuildContext context});
}
