import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/features/auth/presentation/widgets/login/login_view_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * .1.h),
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0.h,
              ),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.appIcon,
                    ),
                    SizedBox(
                      height: 8.h,
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
                          onTap: () {
                            context.navigateTo(
                                routeName: Routes.signUpViewRoute);
                          },
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
    );
  }
}
