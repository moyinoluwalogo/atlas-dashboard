import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for theme mode management
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

/// Application theme configuration
class AppTheme {
  // Color Palette
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFF00BCD4);
  static const Color accentColor = Color(0xFFFF9800);
  static const Color errorColor = Color(0xFFF44336);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFFC107);
  
  // Light Theme Colors
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF212121);
  
  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFE0E0E0);
  
  // Chart Colors
  static const List<Color> chartColors = [
    Color(0xFF2196F3),
    Color(0xFF4CAF50),
    Color(0xFFFF9800),
    Color(0xFF9C27B0),
    Color(0xFFE91E63),
    Color(0xFF00BCD4),
    Color(0xFFFFEB3B),
    Color(0xFF795548),
  ];

  /// Light theme configuration
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightBackground,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: lightBackground,
      surface: lightSurface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: lightText,
      onSurface: lightText,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: lightSurface,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    textTheme: _textTheme(lightText),
    iconTheme: const IconThemeData(color: lightText),
  );

  /// Dark theme configuration
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
      background: darkBackground,
      surface: darkSurface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: darkText,
      onSurface: darkText,
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: darkSurface,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: darkSurface,
      foregroundColor: darkText,
    ),
    textTheme: _textTheme(darkText),
    iconTheme: const IconThemeData(color: darkText),
  );

  /// Common text theme
  static TextTheme _textTheme(Color color) {
    return TextTheme(
      displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300, color: color),
      displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w400, color: color),
      displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: color),
      headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.w400, color: color),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: color),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: color),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color),
    );
  }
}
