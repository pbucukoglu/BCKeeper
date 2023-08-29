import 'dart:ui';

import 'package:get/get.dart';

import 'en_us.dart';
import 'tr_tr.dart';

class AppTranslation {
  // Default locale
  static final locale = Locale('tr', 'TR');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en', 'Us');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['İngilizce', 'Türkçe'];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [Locale('en', 'US'), Locale('tr', 'TR')];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  static Map<String, Map<String, String>> get keys =>
      {'en_US': enUS, 'tr_TR': trTR};

  // Gets locale from language, and updates the locale
  void changeLocale(String? lang) {
    final locale = _getLocaleFromLanguage(lang)!;
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String? lang) {
    for (int i = 0; i < locales.length; i++) {
      if (lang == locales[i].languageCode) return locales[i];
    }
    return Get.locale;
  }

  // Check user's device language and return it as Locale
  Locale? getDeviceLocale() {
    final deviceLocale = window.locale;
    for (final locale in locales) {
      if (locale.languageCode == deviceLocale.languageCode) {
        return locale;
      }
    }
    return fallbackLocale;
  }
}
