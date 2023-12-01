import 'package:flutter/material.dart';

extension LocaleExtension on Locale {
  String get title {
    switch (languageCode) {
      case 'ko':
        return '한국어';
      case 'en':
        return 'English';
      default:
        return '';
    }
  }

  String get flag {
    switch (languageCode) {
      case 'ko':
        return '🇰🇷';
      case 'en':
        return '🇺🇸';
      default:
        return '';
    }
  }
}
