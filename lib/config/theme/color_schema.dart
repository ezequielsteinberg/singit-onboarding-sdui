import 'package:flutter/material.dart';

// Figma Colors extracted from Node 1-249
class AppColors {
  // Text Colors
  static const Color textMain = Color(0xFF211A4C); // "I'm a total beginner"
  static const Color textTitle =
      Color(0xFF000E34); // "What is your English level?"

  // Brand Colors
  static const Color brandBlue = Color(0xFF688CF4); // Progress Bar Fill
  static const Color brandBlueLight = Color(0xFFEFF0FF); // Progress Bar BG

  // UI Colors
  static const Color cardBorder = Color(0xFFD8E0E9);
  static const Color cardBackground = Colors.white;
  static const Color background = Colors.white; // Or the main scaffold bg

  // Shadow
  static const Color shadowColor = Color(0xFFC2C6FF);
}

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.brandBlue,
  onPrimary: Colors.white,
  secondary: AppColors.brandBlue,
  onSecondary: Colors.white,
  error: Color(0xFFBA1A1A),
  onError: Colors.white,
  background: AppColors.background,
  onBackground: AppColors.textMain,
  surface: AppColors.cardBackground,
  onSurface: AppColors.textMain,
  outline: AppColors.cardBorder,
  shadow: AppColors.shadowColor,
);
