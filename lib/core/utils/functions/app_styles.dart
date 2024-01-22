import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';

class AppStyles {
  static TextStyle textStyle20Medium = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle16Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle16Bold = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textStyle24Medium = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle16Medium = TextStyle(
    fontSize: 16.sp,
    color: AppColors.greyColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle14Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
  );
}
