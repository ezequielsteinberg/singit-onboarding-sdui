import 'package:flutter/material.dart';

class AppColors {
  static const Color textMain = Color(0xFF211A4C);
  static const Color textTitle = Color(0xFF000E34);

  static const Color brandBlue = Color(0xFF688CF4);
  static const Color brandBlueLight = Color(0xFFEFF0FF);

  static const Color cardBorder = Color(0xFFD8E0E9);
  static const Color cardBackground = Colors.white;
  static const Color background = Colors.white;

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
  surface: AppColors.cardBackground,
  onSurface: AppColors.textMain,
  outline: AppColors.cardBorder,
  shadow: AppColors.shadowColor,
);
