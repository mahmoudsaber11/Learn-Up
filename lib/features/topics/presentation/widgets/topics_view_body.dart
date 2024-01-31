import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/widgets/card_topics_item.dart';

class TopicsViewBody extends StatelessWidget {
  const TopicsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w, right: 18, top: 54.h),
      child: Column(
        children: [
          const CustomPartOfTopics(),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardTopicsItem(
                width: 140.w,
                text: "History",
                backgroundColor: const Color(0xFFB1ADE6),
              ),
              SizedBox(
                width: 24.w,
              ),
              CardTopicsItem(
                width: 99.w,
                text: "Math",
                backgroundColor: const Color(0xFF7CF2EB),
              ),
            ],
          ),
          SizedBox(
            height: 27.h,
          ),
          CardTopicsItem(
            width: 229.w,
            text: "Cyber security",
            backgroundColor: const Color(0xFF151CBC),
          ),
        ],
      ),
    );
  }
}

class CustomPartOfTopics extends StatelessWidget {
  const CustomPartOfTopics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardTopicsItem(
              text: "Computer Science",
              backgroundColor: const Color(0xFF009688),
              width: 171.w,
            ),
            const CardTopicsItem(
                text: "Business", backgroundColor: AppColors.primaryColor),
          ],
        ),
        SizedBox(
          height: 17.h,
        ),
        CardTopicsItem(
          text: "Arts and Humanities ",
          backgroundColor: const Color(0xFFADD8E6),
          width: 255.w,
        ),
        SizedBox(
          height: 17.h,
        ),
        Row(
          children: [
            CardTopicsItem(
              text: "Arts",
              backgroundColor: const Color(0xFFF1C8C8),
              width: 69.w,
            ),
            SizedBox(
              width: 16.w,
            ),
            const CardTopicsItem(
              text: "Physics",
              backgroundColor: Color(0xFFF27CE6),
            ),
          ],
        ),
        SizedBox(
          height: 16.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardTopicsItem(
              width: 121.w,
              text: "Science",
              backgroundColor: const Color(0xFF12B6EB),
            ),
            const CardTopicsItem(
              text: "Geography",
              backgroundColor: Color(0xFFF93737),
            ),
          ],
        ),
      ],
    );
  }
}
