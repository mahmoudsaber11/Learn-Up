import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/helpers/helper.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/widgets/custom_general_button.dart';
import 'package:learn_up/core/widgets/custom_text_field.dart';
import 'package:learn_up/core/widgets/text_field_label.dart';
import 'package:learn_up/features/auth/presentation/widgets/or_sign_in.dart';
import 'package:learn_up/features/auth/presentation/widgets/sign_with_social.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final GlobalKey<FormState> _formKey;

  void _initFormAttributes() {
    _formKey = GlobalKey<FormState>();
  }

  @override
  void initState() {
    _initFormAttributes();
    super.initState();
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  void _disposeController() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            const TextFieldLabel(label: "Email address"),
            CustomTextField(
                validate: (String? value) => Helper.validateEmailField(value),
                keyboardType: TextInputType.emailAddress,
                hintText: "example@gmail.com",
                controller: _emailController),
            SizedBox(
              height: 50.h,
            ),
            const TextFieldLabel(label: "Password"),
            CustomTextField(
                validate: (String? value) =>
                    Helper.validatePasswordField(value),
                suffix: const Icon(
                  Icons.visibility,
                  color: AppColors.primaryColor,
                ),
                keyboardType: TextInputType.emailAddress,
                hintText: '*********',
                controller: _passwordController),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: AppStyles.textStyle16Regular
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            const OrSignIn(),
            SizedBox(
              height: 16.h,
            ),
            const SignWithSocial(),
            SizedBox(
              height: 17.h,
            ),
            CustomGeneralButton(text: "Login", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
