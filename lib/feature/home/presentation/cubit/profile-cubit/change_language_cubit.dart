import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_shop/core/constants/constants.dart';
import 'package:fruit_shop/core/services/shared_preferences_singleton.dart';


class ChangeLanguageCubit extends Cubit<Locale> {
  final Locale initialLocale;
  ChangeLanguageCubit(this.initialLocale) : super(initialLocale) {
    WidgetsBinding.instance.platformDispatcher.onLocaleChanged = () {
      if (Prefs.getString(kAppLanguageKey) == null) {
        setDeviceLanguage();
      }
    };
  }

  void toggleLanguage(Locale locale) {
    emit(locale);
    _cacheLanguageCode(locale.languageCode);
  }

  void setDeviceLanguage() {
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    emit(deviceLocale);
  }

  void _cacheLanguageCode(String languageCode) async {
    await Prefs.setString(
      kAppLanguageKey,
       languageCode,
    );
  }
}
