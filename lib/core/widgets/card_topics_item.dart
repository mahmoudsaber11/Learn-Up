import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';

class CardTopicsItem extends StatelessWidget {
  const CardTopicsItem({
    super.key,
    this.width,
    required this.text,
    required this.backgroundColor,
  });
  final double? width;
  final String text;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 155.w,
      height: 58.h,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppStyles.textStyle16Bold,
          )),
    );
  }
}
