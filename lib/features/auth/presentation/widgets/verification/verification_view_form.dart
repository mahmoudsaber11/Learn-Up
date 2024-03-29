import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';
import 'package:learn_up/core/utils/widgets/custom_general_button.dart';
import 'package:learn_up/core/utils/widgets/text_field_label.dart';
import 'package:pinput/pinput.dart';

class VerificationViewForm extends StatefulWidget {
  const VerificationViewForm({
    super.key,
  });

  @override
  State<VerificationViewForm> createState() => _ForgetPasswordViewFormState();
}

class _ForgetPasswordViewFormState extends State<VerificationViewForm> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldLabel(label: AppString.otpCode),
        MySizedBox.height20,
        Pinput(
          controller: _otpController,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          listenForMultipleSmsOnAndroid: true,
          defaultPinTheme: PinTheme(
            width: 52.w,
            height: 52.w,
            textStyle: TextStyle(
              fontSize: 22.sp,
              color: AppColors.textColor,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19.r),
              border: Border.all(color: AppColors.primaryColor),
            ),
          ),
          separatorBuilder: (index) => SizedBox(width: 34.w),
          validator: (value) {
            if (value!.isEmpty) {
              return "Pin is Empty";
            }
            return null;
          },
        ),
        MySizedBox.height40,
        CustomGeneralButton(
            text: AppString.verify,
            onPressed: () =>
                context.navigateTo(routeName: Routes.resetPasswordViewRoute)),
      ],
    );
  }
}
