import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';
import 'package:learn_up/features/auth/presentation/widgets/forget_password/forget_password_view_form.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
            onPressed: () => context.getBack(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.greyColor,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: MediaQuery.of(context).size.height * .07),
        child: Column(
          children: [
            Text(
              AppString.forgetPassword,
              style: AppStyles.textStyle24Medium,
            ),
            MySizedBox.height40,
            Text(
              AppString.subTitleForgetPassword,
              style: AppStyles.textStyle16Regular
                  .copyWith(color: AppColors.greyColor),
            ),
            MySizedBox.height16,
            const ForgetPasswordViewForm()
          ],
        ),
      ),
    );
  }
}
