import 'package:flutter/material.dart';
import 'package:fokko/theme/app_colors.dart';
import 'package:fokko/theme/app_typography.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.lightBackground,
        colorScheme: ColorScheme.light(
          primary: AppColors.lightPrimary,
          secondary: AppColors.lightSecondary,
          surface: AppColors.lightBackground,
        ),
        textTheme: AppTypography.light,
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.darkBackground,
        colorScheme: ColorScheme.dark(
          primary: AppColors.darkPrimary,
          secondary: AppColors.darkSecondary,
          surface: AppColors.darkBackground,
        ),
        textTheme: AppTypography.dark,
      );
}
