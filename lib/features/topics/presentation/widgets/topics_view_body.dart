import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';
import 'package:learn_up/core/utils/widgets/card_topics_item.dart';
import 'package:learn_up/core/utils/widgets/custom_part_of_topics.dart';

class TopicsViewBody extends StatelessWidget {
  const TopicsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w, right: 18, top: 54.h),
      child: Column(
        children: [
          const CustomPartOfTopics(),
          MySizedBox.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardTopicsItem(
                width: 140.w,
                text: "History",
                backgroundColor: const Color(0xFFB1ADE6),
              ),
              MySizedBox.width24,
              CardTopicsItem(
                width: 99.w,
                text: "Math",
                backgroundColor: const Color(0xFF7CF2EB),
              ),
            ],
          ),
          MySizedBox.height27,
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
