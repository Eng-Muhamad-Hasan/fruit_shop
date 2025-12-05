import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/services/shared_preferences_singleton.dart';
import 'package:fruit_shop/core/utils/app_themes.dart';

class ChangeThemeCubit extends Cubit<ThemeData> {
  final ThemeData initialTheme;
  ChangeThemeCubit(this.initialTheme) : super(initialTheme) {
    WidgetsBinding
        .instance
        .platformDispatcher
        .onPlatformBrightnessChanged = () {
      if (Prefs.getBool(kDarkModeKey) == null) {
        setDeviceTheme();
      }
    };
  }

  void toggleTheme(ThemeData theme) {
    emit(theme);
    _cacheTheme(theme);
  }

  void setDeviceTheme() {
    final deviceBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final deviceTheme = deviceBrightness == Brightness.dark
        ? AppThemes.getDarkTheme()
        : AppThemes.getLightTheme();
    emit(deviceTheme);
  }

  void _cacheTheme(ThemeData theme) async {
    await Prefs.setBool(
       kDarkModeKey,
     theme == AppThemes.getDarkTheme(),
    );
  }
}
