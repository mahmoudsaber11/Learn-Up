import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/config/routes/routes.dart';
import 'package:learn_up/core/helpers/cache_helper.dart';
import 'package:learn_up/core/helpers/helper.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';
import 'package:learn_up/core/utils/functions/app_navigator.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/functions/my_sized_box.dart';
import 'package:learn_up/core/utils/functions/show_toast.dart';
import 'package:learn_up/core/utils/widgets/custom_circular_progress_indicator.dart';
import 'package:learn_up/core/utils/widgets/custom_general_button.dart';
import 'package:learn_up/core/utils/widgets/custom_text_field.dart';
import 'package:learn_up/core/utils/widgets/text_field_label.dart';
import 'package:learn_up/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:learn_up/features/auth/presentation/cubits/sign_up/sign_up_state.dart';
import 'package:learn_up/features/auth/presentation/widgets/or_sign_in.dart';
import 'package:learn_up/features/auth/presentation/widgets/sign_up/image_picker_avatar.dart';
import 'package:learn_up/features/auth/presentation/widgets/sign_with_social.dart';
import 'package:learn_up/service_locator.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _LoginViewFormState();
}

class _LoginViewFormState extends State<SignUpForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  PlatformFile? _pickedImage;

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
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(listener: (context, state) {
      _handleSignUpState(state, context);
    }, builder: (context, state) {
      var cubit = BlocProvider.of<SignUpCubit>(context);
      return Form(
        key: _formKey,
        child: Column(
          children: [
            Center(
              child: ImagePickerAvatar(
                isLarge: false,
                onPick: (image) {
                  setState(() {
                    _pickedImage = image;
                  });
                },
                pickedImage: _pickedImage,
              ),
            ),
            const TextFieldLabel(label: AppString.emailAddress),
            CustomTextField(
                circular: 20.r,
                validate: Helper.validateEmailField,
                keyboardType: TextInputType.emailAddress,
                hintText: AppString.hintTextEmail,
                controller: _emailController),
            MySizedBox.height16,
            const TextFieldLabel(label: AppString.userName),
            CustomTextField(
                circular: 20.r,
                validate: Helper.validateUserNameField,
                keyboardType: TextInputType.name,
                hintText: AppString.userName,
                controller: _userNameController),
            MySizedBox.height16,
            const TextFieldLabel(label: AppString.password),
            CustomTextField(
                circular: 20.r,
                validate: Helper.validatePasswordField,
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
                hintText: AppString.hintTextPassword,
                controller: _passwordController),
            MySizedBox.height16,
            const TextFieldLabel(label: AppString.confirmPassword),
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
                hintText: AppString.hintTextPassword,
                controller: _confirmController),
            MySizedBox.height16,
            const OrSignIn(),
            MySizedBox.height16,
            const SignWithSocial(),
            MySizedBox.height16,
            state is SignUpLoading
                ? const CustomCircularProgressIndicator()
                : CustomGeneralButton(
                    text: AppString.signUp, onPressed: () => _signUp(context))
          ],
        ),
      );
    });
  }

  void _handleSignUpState(SignUpState state, BuildContext context) {
    if (state is SignUpSuccess) {
      serviceLocator
          .get<CacheHelper>()
          .saveData(key: AppString.cachedUserId, value: Helper.uId)
          .then((value) {
        if (value) {
          context.navigateAndReplacement(newRoute: Routes.layoutViewRoute);
        }
      });
    }
    if (state is SignUpError) {
      showToast(text: state.error, state: ToastStates.error);
    }
  }

  void _signUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<SignUpCubit>(context).userSignUp(
        email: _emailController.text,
        password: _passwordController.text,
        username: _userNameController.text,
        confirmPassword: _confirmController.text,
        profileImage: _pickedImage?.path,
      );
    }
  }
}
