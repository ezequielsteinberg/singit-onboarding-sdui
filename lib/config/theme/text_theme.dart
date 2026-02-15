import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_schema.dart';

class AppTextTheme {
  static TextTheme textTheme = GoogleFonts.nunitoTextTheme().copyWith(
    // Used for main titles (e.g. "What is your English level?")
    headlineSmall: GoogleFonts.nunito(
      fontSize: 24, // Matches visual
      fontWeight: FontWeight.w500, // Medium (500) per Figma
      color: AppColors.textTitle,
      height: 1.36,
    ),

    // Used for option labels (e.g. "I'm a total beginner")
    titleMedium: GoogleFonts.nunito(
      fontSize: 18, // Matches Figma
      fontWeight: FontWeight.w600, // SemiBold (600) per Figma
      color: AppColors.textMain,
      height: 1.36, // 24.55px line height
    ),

    // Used for small labels and captions
    labelSmall: GoogleFonts.nunito(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2,
      color: Colors.grey,
    ),

    // Default body text
    bodyLarge: GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.textMain, // Updated to match Figma text color
      height: 1.5,
    ),
  );
}
