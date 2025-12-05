import 'package:flutter/material.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/services/shared_preferences_singleton.dart';
import 'package:fruit_shop/core/utils/app_languages.dart';
import 'package:fruit_shop/core/utils/app_themes.dart';


Future<({ThemeData theme, Locale locale})> getInitialAppSettings() async {
  final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;

  final deviceBrightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  final isDeviceModeDark = deviceBrightness == Brightness.dark;

  await Prefs.init();

  final isDarkMode =
      Prefs.getBool(kDarkModeKey) ??
      isDeviceModeDark;
  final theme = isDarkMode
      ? AppThemes.getDarkTheme()
      : AppThemes.getLightTheme();

  final languageCode =
      Prefs.getString(kAppLanguageKey) ??
      deviceLocale.languageCode;
  final locale = languageCode == 'en'
      ? AppLanguages.getEnglishLocale()
      : AppLanguages.getArabicLocale();

  return (theme: theme, locale: locale);
}
