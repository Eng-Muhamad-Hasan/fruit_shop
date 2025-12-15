import 'package:flutter/material.dart';
import 'package:fruit_shop/core/utils/app_colors.dart';

final ThemeData originalTheme = ThemeData(
  useMaterial3: true,
  fontFamily: "Cairo",
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
);