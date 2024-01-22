import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/widgets/text_field_label.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          const TextFieldLabel(label: "Email address"),
        ],
      ),
    );
  }
}
