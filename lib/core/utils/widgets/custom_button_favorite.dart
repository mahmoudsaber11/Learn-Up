import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';

class CustomButtonFavorite extends StatelessWidget {
  const CustomButtonFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12.w,
      top: 12.h,
      child: CircleAvatar(
        radius: 12.r,
        backgroundColor: AppColors.backgroundFavorite,
        child: Icon(
          Icons.favorite,
          color: Colors.white,
          size: 16.sp,
        ),
      ),
    );
  }
}
