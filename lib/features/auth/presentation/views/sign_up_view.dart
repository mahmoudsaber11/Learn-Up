import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';
import 'package:learn_up/features/auth/presentation/widgets/sign_up/sign_up_view_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h),
          child: Column(
            children: [
              // Image.asset(
              //   AppAssets.appIcon,
              // ),
              MySizedBox.height8,
              Text(
                AppString.signUp,
                textAlign: TextAlign.center,
                style: AppStyles.textStyle24Medium,
              ),

              MySizedBox.height24,
              const SignUpForm(),
              MySizedBox.height16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.haveAccount,
                    style: AppStyles.textStyle14Medium,
                  ),
                  InkWell(
                    onTap: () {
                      context.navigateTo(routeName: Routes.loginViewRoute);
                    },
                    child: Text(
                      AppString.login,
                      style: AppStyles.textStyle14Medium
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
