import 'package:flutter/material.dart';
import 'package:fruit_shop/core/themes/app_theme_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppThemeColors.primary,
  scaffoldBackgroundColor: AppThemeColors.background,
  colorScheme: const ColorScheme.light(
    primary: AppThemeColors.primary,
    primaryContainer: AppThemeColors.primaryVariant,
    secondary: AppThemeColors.secondary,
    secondaryContainer: AppThemeColors.secondaryVariant,
    surface: AppThemeColors.surface,
    error: AppThemeColors.error,
    onPrimary: AppThemeColors.onPrimary,
    onSecondary: AppThemeColors.onSecondary,
    onSurface: AppThemeColors.onSurface,
    onError: AppThemeColors.onError,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppThemeColors.primary,
    foregroundColor: AppThemeColors.onPrimary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppThemeColors.primary,
    foregroundColor: AppThemeColors.onPrimary,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppThemeColors.primary,
      foregroundColor: AppThemeColors.onPrimary,
      maximumSize: const Size(double.infinity, 40),
    ),
  ),
);
