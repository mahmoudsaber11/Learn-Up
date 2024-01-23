import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.keyboardType,
    required this.controller,
    this.hintText,
    this.validate,
    this.onChange,
    this.isPassword,
    this.suffix,
    this.prefix,
    this.onSubmit,
    this.autofillHints,
    this.focusNode,
    this.onEditingComplete,
    this.textCapitalization = TextCapitalization.none,
    required this.circular,
  });

  final TextInputType keyboardType;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final ValueSetter? onChange;
  final bool? isPassword;
  final Widget? suffix;
  final Widget? prefix;
  final Function(String submittedText)? onSubmit;
  final List<String>? autofillHints;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final TextCapitalization textCapitalization;
  final double circular;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circular),
      ),
      child: TextFormField(
        obscureText: isPassword ?? false,
        autofillHints: autofillHints,
        validator: validate,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        onEditingComplete: onEditingComplete,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        cursorColor: Colors.black,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          suffixIcon: suffix,
          prefixIcon: prefix,
          focusedBorder: _buildTextFieldOutlinedBorder(),
          focusedErrorBorder: _buildTextFieldOutlinedBorder(),
          errorBorder: _buildTextFieldOutlinedBorder(),
          disabledBorder: _buildTextFieldOutlinedBorder(),
          hintText: hintText!,

          // labelStyle: AppTextStyles.textStyle16Medium,
          filled: true,
          fillColor: Colors.transparent,
          border: _buildTextFieldOutlinedBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder _buildTextFieldOutlinedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide.none,
    );
  }
}
