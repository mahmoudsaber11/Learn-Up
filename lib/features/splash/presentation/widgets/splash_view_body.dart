import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/helpers/cache_helper.dart';
import 'package:learn_up/core/helpers/helper.dart';

import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/service_locator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  late Timer _timer;
  void _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2500), () => _goToNext());
  }

  void _goToNext() {
    Helper.uId = serviceLocator
        .get<CacheHelper>()
        .getStringData(key: AppString.cachedUserId);

    bool? onBoarding = serviceLocator
        .get<CacheHelper>()
        .getBoolData(key: AppString.cachedOnboarding);

    if (onBoarding != null) {
      if (Helper.uId != null) {
        context.navigateAndReplacement(
          newRoute: Routes.layoutViewRoute,
        );
      } else {
        context.navigateAndReplacement(newRoute: Routes.loginViewRoute);
      }
    } else {
      context.navigateAndReplacement(newRoute: Routes.onBoardingViewRoute);
    }
  }

  void _setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final double bottomPadding = View.of(context).viewPadding.bottom;

    // Set the color based on the presence of the system navigation bar
    final Color? systemNavigationBarColor =
        bottomPadding > 0 ? null : Colors.transparent;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: systemNavigationBarColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    _setSystemUIOverlayStyle();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.appIcon,
            fit: BoxFit.cover,
          ),
          Text(
            "Learn Up",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
