import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';

class CustomTextAndIcon extends StatelessWidget {
  const CustomTextAndIcon({
    super.key,
    required this.icon,
    required this.text,
  });
  final Icon icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, bottom: 30.h),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: icon),
          SizedBox(
            width: 30.w,
          ),
          Text(
            text,
            style: AppStyles.textStyle24Medium.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
