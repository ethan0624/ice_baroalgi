import 'package:auto_route/auto_route.dart';
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

  Future<bool?> showAlert({
    required String title,
    String? message,
  }) {
    return showDialog<bool>(
      context: this,
      builder: (context) {
        return AlertDialog.adaptive(
          title: Text(
            title,
            style: textTheme.bodySmall,
          ),
          content: message != null
              ? Text(
                  message,
                  style: textTheme.labelLarge,
                )
              : null,
          actions: [
            TextButton(
              onPressed: () => context.router.pop(true),
              child: Text(
                '확인',
                style: textTheme.bodySmall?.copyWith(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
}
