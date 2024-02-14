import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';

class CustomTextAndIcon extends StatelessWidget {
  const CustomTextAndIcon({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });
  final Icon icon;
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, bottom: 30.h),
      child: Row(
        children: [
          IconButton(onPressed: onPressed, icon: icon),
          MySizedBox.width30,
          Text(
            text,
            style: AppStyles.textStyle24Medium.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
