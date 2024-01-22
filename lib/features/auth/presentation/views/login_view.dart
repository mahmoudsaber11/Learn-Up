import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/features/auth/presentation/widgets/login/login_view_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                sliver: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Image.asset(
                        AppAssets.appIcon,
                      ),
                      Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: AppStyles.textStyle24Medium,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      const LoginViewForm(),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t  have an account ?",
                            style: AppStyles.textStyle14Medium,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Sign up",
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
            ],
          ),
        ),
      ),
    );
  }
}
