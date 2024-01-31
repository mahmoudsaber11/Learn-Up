import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/widgets/card_topics_item.dart';
import 'package:learn_up/core/widgets/custom_part_of_topics.dart';

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
