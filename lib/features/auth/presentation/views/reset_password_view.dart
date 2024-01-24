import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/features/auth/presentation/widgets/reset_password/reset_password_view_form.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: MediaQuery.of(context).size.height * .07),
          child: Column(
            children: [
              Text(
                "Reset Password",
                style: AppStyles.textStyle24Medium,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Enter your  new password ,make sure  that it should at least 8 characters started by _ ",
                style: AppStyles.textStyle16Regular
                    .copyWith(color: AppColors.greyColor),
              ),
              SizedBox(
                height: 16.h,
              ),
              const ResetPasswordForm()
            ],
          ),
        ),
      ),
    );
  }
}
