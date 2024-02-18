import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/helpers/helper.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';
import 'package:learn_up/core/utils/functions/show_toast.dart';
import 'package:learn_up/core/utils/widgets/custom_general_button.dart';
import 'package:learn_up/core/utils/widgets/custom_text_field.dart';
import 'package:learn_up/core/utils/widgets/text_field_label.dart';
import 'package:learn_up/features/auth/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'package:learn_up/features/auth/presentation/cubits/forget_password/forget_password_state.dart';

class ForgetPasswordViewForm extends StatefulWidget {
  const ForgetPasswordViewForm({
    super.key,
  });

  @override
  State<ForgetPasswordViewForm> createState() => _ForgetPasswordViewFormState();
}

class _ForgetPasswordViewFormState extends State<ForgetPasswordViewForm> {
  final TextEditingController _emailController = TextEditingController();
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
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const TextFieldLabel(label: AppString.emailAddress),
          CustomTextField(
              circular: 20.r,
              validate: Helper.validateEmailField,
              keyboardType: TextInputType.emailAddress,
              hintText: AppString.hintTextEmail,
              controller: _emailController),
          MySizedBox.height22,
          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              _handleForgotPasswordState(state, context, _emailController.text);
            },
            builder: (context, state) {
              if (state is ForgetPasswordLoading) {
                return const CircularProgressIndicator();
              } else {
                return CustomGeneralButton(
                    text: AppString.verifyEmail,
                    onPressed: () => _forgetPassword(context));
              }
            },
          ),
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
                style:
                    AppStyles.textStyle12Medium.copyWith(color: Colors.black),
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
      ),
    );
  }

  void _handleForgotPasswordState(
    ForgetPasswordState state,
    BuildContext context,
    String email,
  ) {
    if (state is ForgetPasswordSuccess) {
      showToast(text: state.toString(), state: ToastStates.success);
      context.navigateTo(
        routeName: Routes.verificationViewRoute,
        arguments: email,
      );
    }
    if (state is ForgetPasswordError) {
      showToast(text: state.error, state: ToastStates.error);
    }
  }

  void _forgetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<ForgetPasswordCubit>(context)
          .forgetPassword(email: _emailController.text);
    }
  }
}
