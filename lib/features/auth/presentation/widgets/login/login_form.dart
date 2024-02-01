import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/helpers/cache_helper.dart';
import 'package:learn_up/core/helpers/helper.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/functions/app_styles.dart';
import 'package:learn_up/core/utils/functions/show_toast.dart';
import 'package:learn_up/core/utils/widgets/custom_circular_progress_indicator.dart';
import 'package:learn_up/core/utils/widgets/custom_general_button.dart';
import 'package:learn_up/core/utils/widgets/custom_text_field.dart';
import 'package:learn_up/core/utils/widgets/text_field_label.dart';
import 'package:learn_up/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:learn_up/features/auth/presentation/cubits/login/login_state.dart';
import 'package:learn_up/features/auth/presentation/widgets/or_sign_in.dart';
import 'package:learn_up/features/auth/presentation/widgets/sign_with_social.dart';
import 'package:learn_up/service_locator.dart';

class LoginViewForm extends StatefulWidget {
  const LoginViewForm({super.key});

  @override
  State<LoginViewForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<LoginViewForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode autovalidateMode;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  void _initFormAttributes() {
    _formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void initState() {
    _initFormAttributes();
    super.initState();
  }

  @override
  void dispose() {
    _disposeController();
    _disposeFocusNodes();
    super.dispose();
  }

  void _disposeFocusNodes() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  void _disposeController() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) => _handleLoginStates(state, context),
        builder: (context, state) {
          var cubit = BlocProvider.of<LoginCubit>(context);
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
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    autofillHints: const [AutofillHints.email],
                    focusNode: _emailFocusNode,
                    hintText: "example@gmail.com",
                    controller: _emailController),
                SizedBox(
                  height: 20.h,
                ),
                const TextFieldLabel(label: "Password"),
                CustomTextField(
                    autofillHints: const <String>[AutofillHints.password],
                    circular: 20.r,
                    validate: (String? value) =>
                        Helper.validatePasswordField(value),
                    focusNode: _passwordFocusNode,
                    isPassword: cubit.isPassword,
                    onSubmit: (_) => _login(context),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => context.navigateTo(
                        routeName: Routes.forgetPasswordViewRoute),
                    child: Text(
                      "Forget Password?",
                      style: AppStyles.textStyle16Regular
                          .copyWith(color: AppColors.primaryColor),
                    ),
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
                state is LoginLoading
                    ? const CustomCircularProgressIndicator()
                    : CustomGeneralButton(
                        text: "Login", onPressed: () => _login(context))
              ],
            ),
          );
        });
  }

  void _handleLoginStates(LoginState state, BuildContext context) {
    if (state is LoginSuccess) {
      serviceLocator
          .get<CacheHelper>()
          .saveData(key: AppString.cachedUserId, value: state.uId)
          .then((value) {
        if (value) {
          Helper.uId = state.uId;
          Helper.currentUser = state.user;
          context.navigateAndReplacement(
            newRoute: Routes.layoutViewRoute,
          );
        }
      });
    }
    if (state is LoginError) {
      showToast(text: state.error, state: ToastStates.error);
    }
  }

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Helper.keyboardUnfocus(context);
      BlocProvider.of<LoginCubit>(context).userLogin(
          email: _emailController.text, password: _passwordController.text);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
