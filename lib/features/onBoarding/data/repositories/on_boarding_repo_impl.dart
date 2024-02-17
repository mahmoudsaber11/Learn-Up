import 'package:flutter/material.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/helpers/cache_helper.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/features/onBoarding/data/model/on_boarding_model.dart';
import 'package:learn_up/features/onBoarding/data/repositories/on_boarding_repo.dart';
import 'package:learn_up/service_locator.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  @override
  List<OnBoardingModel> onBoardingPages() {
    return const <OnBoardingModel>[
      OnBoardingModel(
          title: AppString.onBoardingTitle1,
          image: AppAssets.onBoarding1,
          subTitle: AppString.onBoardingSubTitle1),
      OnBoardingModel(
          title: AppString.onBoardingTitle2,
          image: AppAssets.onBoarding2,
          subTitle: AppString.onBoardingSubTitle2),
      OnBoardingModel(
          title: AppString.onBoardingTitle3,
          image: AppAssets.onBoarding3,
          subTitle: AppString.onBoardingSubTitle3),
    ];
  }

  @override
  void navigateBetweenPages(
      {required BuildContext context,
      required PageController pageController,
      required bool isLastBoarding}) {
    if (isLastBoarding) skipToLogin(context: context);
    pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastEaseInToSlowEaseOut);
  }

  @override
  void skipToLogin({required BuildContext context}) {
    serviceLocator
        .get<CacheHelper>()
        .saveData(key: AppString.cachedOnboarding, value: true)
        .then(
      (value) {
        if (value) {
          context.navigateAndReplacement(newRoute: Routes.loginViewRoute);
        }
      },
    );
  }
}
