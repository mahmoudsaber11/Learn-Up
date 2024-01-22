import 'package:flutter/material.dart';
import 'package:learn_up/core/utils/functions/app_colors.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      );
}
