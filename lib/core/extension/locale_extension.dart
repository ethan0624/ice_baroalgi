import 'package:flutter/material.dart';

extension LocaleExtension on Locale {
  String get title {
    switch (languageCode) {
      case 'ko':
        return '한국어';
      case 'en':
        return 'English';
      case 'ru':
        return 'Русский';
      case 'vi':
        return 'Tiếng Việt';
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
      case 'ru':
        return '🇷🇺';
      case 'vi':
        return '🇻🇳';
      default:
        return '';
    }
  }
}
