import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';
import 'package:learn_up/features/onBoarding/data/model/on_boarding_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.pageInfo,
  });
  final OnBoardingModel pageInfo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          pageInfo.title,
          style: AppStyles.textStyle20Medium,
        ),
        MySizedBox.height40,
        Image.asset(
          pageInfo.image,
          height: 251.h,
          width: 273.w,
        ),
        MySizedBox.height40,
        Text(
          pageInfo.subTitle,
          textAlign: TextAlign.center,
          style: AppStyles.textStyle16Regular,
        ),
      ],
    );
  }
}
