import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 9.h),
      child: Text(
        label,
        style: AppStyles.textStyle16Regular
            .copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
