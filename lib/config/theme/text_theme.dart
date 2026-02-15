import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schema.dart';

class AppTextTheme {
  static TextTheme textTheme = GoogleFonts.nunitoTextTheme().copyWith(
    headlineSmall: GoogleFonts.nunito(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.textTitle,
      height: 1.36,
    ),
    titleMedium: GoogleFonts.nunito(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textMain,
      height: 1.36,
    ),
    labelSmall: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2,
      color: Colors.grey,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.textMain,
      height: 1.5,
    ),
  );
}
