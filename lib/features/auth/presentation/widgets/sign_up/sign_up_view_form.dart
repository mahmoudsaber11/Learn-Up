import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/helpers/helper.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/widgets/custom_general_button.dart';
import 'package:learn_up/core/utils/widgets/custom_text_field.dart';
import 'package:learn_up/core/utils/widgets/text_field_label.dart';
import 'package:learn_up/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:learn_up/features/auth/presentation/cubits/sign_up/sign_up_state.dart';
import 'package:learn_up/features/auth/presentation/widgets/or_sign_in.dart';
import 'package:learn_up/features/auth/presentation/widgets/sign_with_social.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameContorller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
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
    _userNameContorller.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<SignUpCubit>(context);
          return Form(
            key: _formKey,
            child: Column(
              children: [
                const TextFieldLabel(label: "Email address"),
                CustomTextField(
                    circular: 20.r,
                    validate: (String? value) =>
                        Helper.validateEmailField(value),
                    keyboardType: TextInputType.emailAddress,
                    hintText: "example@gmail.com",
                    controller: _emailController),
                SizedBox(
                  height: 16.h,
                ),
                const TextFieldLabel(label: "Username"),
                CustomTextField(
                    circular: 20.r,
                    validate: (String? value) =>
                        Helper.validateUserNameField(value),
                    keyboardType: TextInputType.name,
                    hintText: "userName",
                    controller: _userNameContorller),
                SizedBox(
                  height: 16.h,
                ),
                const TextFieldLabel(label: "Password"),
                CustomTextField(
                    circular: 20.r,
                    validate: (String? value) =>
                        Helper.validatePasswordField(value),
                    isPassword: cubit.isPassword,
                    suffix: IconButton(
                        onPressed: () {
                          cubit.switchPassVisibility();
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
                        onPressed: () {
                          cubit.switchConfirmPassVisibility();
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
                const OrSignIn(),
                SizedBox(
                  height: 16.h,
                ),
                const SignWithSocial(),
                SizedBox(
                  height: 17.h,
                ),
                CustomGeneralButton(text: "Sign up", onPressed: () {})
              ],
            ),
          );
        });
  }
}
