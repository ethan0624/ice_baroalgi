import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

const double defaultMarginValue = 24;

class AppColor {
  // 브랜드 컬러
  static Color primary = const Color(0xFFE65185);
  static Color secondary = const Color(0xFFFFC6D9);

  // 배경컬러
  static Color background = const Color(0xFFF5F5F5);
  static Color secondaryBackground = const Color(0xFFFFEDF3);

  // 알림컬러
  static Color notice = const Color(0xFFDE0000);
  static Color secondaryNotice = const Color(0xFF25BF00);

  // 라인컬러
  static Color dividerLight = const Color(0xFFEEEEEE);
  static Color dividerMedium = const Color(0xFFDBDBDB);
  static Color dividerDark = const Color(0xFFCCCCCC);

  // 태그라인컬러
  static Color linePurple = const Color(0xFF6351E9);
  static Color lineBlue = const Color(0xFF007AAF);
}

// 폰트 컬러
class AppTextColor {
  static Color light = const Color(0xFF999999);
  static Color medium = const Color(0xFF767676);
  static Color dark = const Color(0xFF191919);
}

class AppTheme {
  static final defaultTextStyle = GoogleFonts.notoSansNKo(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    height: 1.6,
    letterSpacing: 0.9,
    color: Colors.black,
  );

  static final defaultColorScheme = ColorScheme(
    primary: AppColor.primary,
    onPrimary: AppColor.background,
    secondary: AppColor.secondary,
    onSecondary: AppColor.background,
    error: AppColor.notice,
    onError: AppColor.background,
    background: AppColor.background,
    onBackground: AppColor.background,
    surface: AppColor.background,
    onSurface: AppColor.background,
    brightness: Brightness.light,
    outline: AppColor.dividerMedium,
    surfaceTint: Colors.transparent,
  );

  static final defaultTextTheme = TextTheme(
    displayLarge: defaultTextStyle.copyWith(
        fontWeight: FontWeight.w600, fontSize: 57, height: 1.55),
    displayMedium:
        defaultTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 45),
    displaySmall:
        defaultTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 36),
    headlineLarge: defaultTextStyle.copyWith(
        fontWeight: FontWeight.bold, fontSize: 34, height: 1.44),
    headlineMedium: defaultTextStyle.copyWith(
        fontWeight: FontWeight.bold, fontSize: 32, height: 1.44),
    headlineSmall: defaultTextStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 30, height: 1.5),
    titleLarge: defaultTextStyle.copyWith(
        fontWeight: FontWeight.bold, fontSize: 26, height: 1.46),
    titleMedium: defaultTextStyle.copyWith(
        fontWeight: FontWeight.bold, fontSize: 22, height: 1.44),
    titleSmall: defaultTextStyle.copyWith(
        fontWeight: FontWeight.bold, fontSize: 19, height: 1.42),
    bodyLarge: defaultTextStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 18, height: 1.5),
    bodyMedium: defaultTextStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 15, height: 1.42), // 32
    bodySmall: defaultTextStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 13, height: 1.42),
    labelLarge: defaultTextStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 14, height: 1.38),
    labelMedium: defaultTextStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 12, height: 1.38),
    labelSmall: defaultTextStyle.copyWith(
        fontWeight: FontWeight.w500, fontSize: 10, height: 1.38),
  );

  static final themeData = ThemeData(
    primaryColor: AppColor.primary,
    iconTheme: IconThemeData(color: Colors.grey.shade900),
    scaffoldBackgroundColor: Colors.grey.shade100,
    brightness: Brightness.light,
    secondaryHeaderColor: Colors.grey.shade600,
    shadowColor: Colors.grey.shade200,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.grey.shade900,
      ),
      actionsIconTheme: IconThemeData(color: Colors.grey.shade900),
      titleTextStyle: defaultTextStyle,
    ),
    textTheme: defaultTextTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey.shade500,
    ),
    colorScheme: defaultColorScheme,
  );

  static final light = themeData;
  static final dark = themeData;
}
