import 'package:flutter/material.dart';
import 'package:fokko/theme/app_colors.dart';
import 'package:fokko/theme/app_typography.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.primaryColor,
      textTheme: TextTheme(
        titleLarge: AppTypography.title,
        bodyMedium: AppTypography.body,
        labelSmall: AppTypography.label,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        surface: AppColors.backgroundColor,
        brightness: Brightness.light,
      ),
    );
  }
}
