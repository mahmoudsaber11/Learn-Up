import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/helpers/helper.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';
import 'package:learn_up/core/utils/widgets/custom_general_button.dart';
import 'package:learn_up/core/utils/widgets/custom_text_field.dart';
import 'package:learn_up/core/utils/widgets/text_field_label.dart';

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
        const TextFieldLabel(label: AppString.emailAddress),
        CustomTextField(
            circular: 20.r,
            validate: Helper.validateEmailField,
            keyboardType: TextInputType.emailAddress,
            hintText: AppString.hintTextEmail,
            controller: _emailController),
        MySizedBox.height22,
        CustomGeneralButton(
            text: AppString.verifyEmail,
            onPressed: () =>
                context.navigateTo(routeName: Routes.verificationViewRoute)),
        MySizedBox.height16,
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
        MySizedBox.height24,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppString.notAccount,
              style: AppStyles.textStyle12Medium.copyWith(color: Colors.black),
            ),
            InkWell(
              onTap: () =>
                  context.navigateTo(routeName: Routes.signUpViewRoute),
              child: Text(
                AppString.signUp,
                style: AppStyles.textStyle12Medium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
