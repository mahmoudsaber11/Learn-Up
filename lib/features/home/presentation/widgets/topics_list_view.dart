import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/widgets/card_topics_item.dart';

class TopicsListView extends StatelessWidget {
  const TopicsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => const CardTopicsItem(
          text: "Business",
          backgroundColor: AppColors.primaryColor,
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 4.w,
        ),
      ),
    );
  }
}
