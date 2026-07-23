import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF7C3AED);
  static const Color secondary = Color(0xFFEC4899);
  static const Color darkBg = Color(0xFF0F172A);
  static const Color cardBg = Color(0xFF1E293B);
  static const Color textPrimary = Color(0xFFE2E8F0);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color greenAccent = Color(0xFF22C55E);
  static const Color borderColor = Color(0xFF334155);

  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: darkBg,
        primaryColor: primary,
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: secondary,
          surface: cardBg,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: textPrimary, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: textPrimary),
          bodyMedium: TextStyle(color: textSecondary),
        ),
      );
}

