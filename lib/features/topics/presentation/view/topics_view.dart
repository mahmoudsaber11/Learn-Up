import 'package:flutter/material.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/features/topics/presentation/widgets/topics_view_body.dart';

class TopicsView extends StatelessWidget {
  const TopicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: const TopicsViewBody(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Topics",
        style: AppStyles.textStyle24Medium,
      ),
      leading: IconButton(
          onPressed: () {
            context.getBack();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.greyColor,
          )),
    );
  }
}
