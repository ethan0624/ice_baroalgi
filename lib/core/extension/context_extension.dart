import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// theme
  ThemeData get theme => Theme.of(this);

  /// color
  ColorScheme get colorScheme => theme.colorScheme;

  /// text
  TextTheme get textTheme => theme.textTheme;

  /// media query
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get pixelRatio => mediaQuery.devicePixelRatio;

  bool get isSmallPhone => size.width <= 375;

  bool get isPhone => size.width < 620;

  bool get isTablet => size.width >= 620 && size.width < 720;

  List<Locale> get supportedLocales => const [
        Locale('ko', 'KR'),
        Locale('en', 'EN'),
        Locale('zh', 'CN'),
      ];
}
