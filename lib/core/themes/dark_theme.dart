import 'package:flutter/material.dart';
import 'package:fruit_shop/core/themes/app_theme_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppThemeColors.darkPrimary,
  scaffoldBackgroundColor: AppThemeColors.darkBackground,
  colorScheme: const ColorScheme.dark(
    primary: AppThemeColors.darkPrimary,
    primaryContainer: AppThemeColors.darkPrimaryVariant,
    secondary: AppThemeColors.darkSecondary,
    secondaryContainer: AppThemeColors.darkSecondaryVariant,
    surface: AppThemeColors.darkSurface,
    error: AppThemeColors.darkError,
    onPrimary: AppThemeColors.darkOnPrimary,
    onSecondary: AppThemeColors.darkOnSecondary,
    onSurface: AppThemeColors.darkOnSurface,
    onError: AppThemeColors.darkOnError,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppThemeColors.darkPrimary,
    foregroundColor: AppThemeColors.darkOnPrimary,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppThemeColors.darkPrimary,
    foregroundColor: AppThemeColors.darkOnPrimary,
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: AppThemeColors.darkPrimary,
      foregroundColor: AppThemeColors.darkOnPrimary,
      maximumSize: const Size(double.infinity, 40),
    ),
  ),
);
