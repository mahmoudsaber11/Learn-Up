import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/helpers/helper.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/widgets/custom_general_button.dart';
import 'package:learn_up/core/widgets/custom_text_field.dart';
import 'package:learn_up/core/widgets/text_field_label.dart';

class ForgetPasswordViewForm extends StatefulWidget {
  const ForgetPasswordViewForm({
    super.key,
  });

  @override
  State<ForgetPasswordViewForm> createState() => _ForgetPasswordViewFormState();
}

class _ForgetPasswordViewFormState extends State<ForgetPasswordViewForm> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldLabel(label: "Email address"),
        CustomTextField(
            circular: 20.r,
            validate: (String? value) => Helper.validateEmailField(value),
            keyboardType: TextInputType.emailAddress,
            hintText: "example@gmail.com",
            controller: _emailController),
        SizedBox(
          height: 22.h,
        ),
        CustomGeneralButton(text: "Verify Email", onPressed: () {}),
        SizedBox(
          height: 16.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {},
            child: Text(
              "Don’t get? send me new Email",
              style: AppStyles.textStyle12Medium,
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don’t  have an account ?",
              style: AppStyles.textStyle12Medium.copyWith(color: Colors.black),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "Sign up",
                style: AppStyles.textStyle12Medium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
