import 'package:flutter/material.dart';
import 'color_schema.dart';
import 'text_theme.dart';
import 'theme_extension.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      textTheme: AppTextTheme.textTheme,
      extensions: <ThemeExtension<dynamic>>[
        AppColorsExtension.light,
      ],
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.surface,
        foregroundColor: lightColorScheme.onSurface,
        elevation: 0,
      ),
      scaffoldBackgroundColor: lightColorScheme.surface,
    );
  }
}
