import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/app_router.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';

class LearnUpApp extends StatelessWidget {
  const LearnUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppString.appTitle,
        onGenerateRoute: AppRouter.onGenerateRoute),
      ),
    )
  }
}
