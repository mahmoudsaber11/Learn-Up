import 'package:flutter/material.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/features/onBoarding/data/model/on_boarding_model.dart';
import 'package:learn_up/features/onBoarding/data/repositories/on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  @override
  List<OnBoardingModel> onBoardingPages() {
    return const <OnBoardingModel>[
      OnBoardingModel(
          title: "Easy Registration",
          image: AppAssets.onBoarding1,
          subTitle:
              "Begin your learning journey with learn app \n by creating a personal account. Enter your \n information and log in to access \n personalized content."),
      OnBoardingModel(
          title: "Explore Courses and Fields",
          image: AppAssets.onBoarding2,
          subTitle:
              "Discover our world of knowledge! Browse a \n variety of courses and educational fields. \n Search and find what suits your interests \n and goals."),
      OnBoardingModel(
          title: "Choose a Course and Get a Certificate",
          image: AppAssets.onBoarding3,
          subTitle:
              "Select the course you want to study and \n your preferred instructor. Watch \n educational videos and receive your \n certificate upon successful course \n completion."),
    ];
  }

  @override
  void navigateBetweenPages(
      {required BuildContext context,
      required PageController pageController,
      required bool isLastBoarding}) {
    pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut);
  }
}
