import 'package:flutter/material.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';

class CustomTextType extends StatelessWidget {
  const CustomTextType({
    super.key,
    required this.type,
    this.onPressed,
  });
  final String type;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: AppStyles.textStyle16Regular
              .copyWith(color: AppColors.primaryColor),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              AppString.seeAll,
              style: AppStyles.textStyle14Medium
                  .copyWith(color: AppColors.greyColor),
            )),
      ],
    );
  }
}
