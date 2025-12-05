import 'package:flutter/material.dart';
import 'package:fruit_shop/core/themes/dark_theme.dart';
import 'package:fruit_shop/core/themes/light_theme.dart';

abstract class AppThemes {
  static ThemeData getLightTheme() => lightTheme;
  static ThemeData getDarkTheme() => darkTheme;
}
