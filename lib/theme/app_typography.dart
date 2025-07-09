import 'package:flutter/material.dart';
import 'package:fokko/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextTheme light = TextTheme(
    displayMedium: GoogleFonts.inter(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: AppColors.lightText,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.lightText,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 16,
      color: AppColors.lightText,
    ),
  );

  static TextTheme dark = TextTheme(
    displayMedium: GoogleFonts.inter(
      fontSize: 48,
      fontWeight: FontWeight.bold,
      color: AppColors.darkText,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.darkText,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 16,
      color: AppColors.darkText,
    ),
  );
}
