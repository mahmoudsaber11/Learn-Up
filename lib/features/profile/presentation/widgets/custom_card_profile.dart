import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';

class CustomCardProfile extends StatelessWidget {
  const CustomCardProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        children: [
          SizedBox(
            width: 16.w,
          ),
          Image.asset(
            AppAssets.imagesProfile,
          ),
          SizedBox(
            width: 8.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Jenny Wilson",
                style:
                    AppStyles.textStyle16Regular.copyWith(color: Colors.white),
              ),
              Text(
                "kenzi.lawson@example.com",
                style: TextStyle(
                  color: const Color(0x94F9E7E7),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
