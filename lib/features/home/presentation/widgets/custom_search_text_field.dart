import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_up/core/utils/functions/app_assets.dart';
import 'package:learn_up/core/utils/functions/app_string.dart';
import 'package:learn_up/core/utils/widgets/custom_text_field.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 67.w),
      child: CustomTextField(
          circular: 8.r,
          prefix: IconButton(
              onPressed: () {}, icon: Image.asset(AppAssets.iconSearch)),
          suffix: IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppAssets.iconFilter,
              )),
          hintText: AppString.hintTextSearch,
          keyboardType: TextInputType.text,
          controller: _searchController),
    );
  }
}
