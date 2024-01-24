import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/helpers/helper.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/widgets/custom_general_button.dart';
import 'package:learn_up/core/widgets/custom_text_field.dart';
import 'package:learn_up/core/widgets/text_field_label.dart';
import 'package:learn_up/features/auth/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'package:learn_up/features/auth/presentation/cubits/reset_password/reset_password_state.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<ResetPasswordForm> {
  final TextEditingController _confirmController = TextEditingController();
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
    _confirmController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
      var cubit = BlocProvider.of<ResetPasswordCubit>(context);
      return Form(
        key: _formKey,
        child: Column(
          children: [
            const TextFieldLabel(label: "Password"),
            CustomTextField(
                circular: 20.r,
                validate: (String? value) =>
                    Helper.validatePasswordField(value),
                isPassword: cubit.isPassword,
                suffix: IconButton(
                    onPressed: () {
                      cubit.changePasswordVisibility();
                    },
                    icon: Icon(
                      cubit.isPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.primaryColor,
                    )),
                keyboardType: TextInputType.visiblePassword,
                hintText: '*********',
                controller: _passwordController),
            SizedBox(
              height: 16.h,
            ),
            const TextFieldLabel(label: "Confirm Password"),
            CustomTextField(
                circular: 20.r,
                validate: (String? value) =>
                    Helper.validateConfirmPasswordField(
                      value: value,
                      password: _passwordController.text,
                      confirmPassword: _confirmController.text,
                    ),
                isPassword: cubit.isPassword,
                suffix: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      cubit.isPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.primaryColor,
                    )),
                keyboardType: TextInputType.visiblePassword,
                hintText: '*********',
                controller: _passwordController),
            SizedBox(
              height: 32.h,
            ),
            CustomGeneralButton(
                text: "Reset Password",
                onPressed: () {
                  context.navigateTo(routeName: Routes.layoutViewRoute);
                })
          ],
        ),
      );
    });
  }
}
