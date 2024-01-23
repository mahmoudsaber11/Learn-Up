import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/features/auth/presentation/widgets/sign_up/sign_up_view_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Image.asset(
                  AppAssets.appIcon,
                ),
                Text(
                  "Sign up",
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle24Medium,
                ),
                SizedBox(
                  height: 24.h,
                ),
                const SignUpForm(),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You already have an account ?",
                      style: AppStyles.textStyle14Medium,
                    ),
                    InkWell(
                      onTap: () {
                        context.navigateTo(routeName: Routes.loginViewRoute);
                      },
                      child: Text(
                        "Login",
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
      ),
    );
  }
}