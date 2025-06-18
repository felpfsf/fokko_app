import 'package:flutter/material.dart';
import 'package:fokko/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static final TextStyle title = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static final TextStyle body = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textDark,
  );

  static final TextStyle label = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.textLight,
  );
}
