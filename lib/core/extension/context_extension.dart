import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/route/app_router.dart';

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

  Future<void> share({required String title}) async {
    // todo : 스토어 링크로 변경
    const storeUrl = 'https://store.com/todo';
    await Share.share('$title $storeUrl', subject: title);
  }

  Future<bool?> showAlert({
    required String title,
    String? message,
  }) {
    return showDialog<bool>(
      context: this,
      builder: (context) {
        return AlertDialog.adaptive(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          surfaceTintColor: Colors.transparent,
          title: Text(
            title,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: message != null
              ? Text(
                  message,
                  style: textTheme.bodyMedium,
                )
              : null,
          actions: [
            TextButton(
              onPressed: () => context.router.pop(true),
              child: Text(
                '확인'.tr(),
                style: textTheme.bodySmall?.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> showConfirm({
    required String title,
    String? message,
    String? positiveButtonText,
  }) {
    return showDialog<bool>(
      context: this,
      builder: (context) {
        return AlertDialog.adaptive(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          surfaceTintColor: Colors.transparent,
          title: Text(
            title,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: message != null
              ? Text(
                  message,
                  style: textTheme.bodyMedium,
                )
              : null,
          actions: [
            TextButton(
              onPressed: () => context.router.pop(false),
              child: Text(
                '취소'.tr(),
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.router.pop(true),
              child: Text(
                positiveButtonText ?? '확인'.tr(),
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> showToast({required String message}) {
    return EasyLoading.showToast(
      message,
      toastPosition: EasyLoadingToastPosition.bottom,
    );
  }

  checkLoginOrRequestLogin({required VoidCallback onLoggedIn}) async {
    final authProvider = getIt<AuthProvider>();
    if (authProvider.isAuthenticated()) {
      onLoggedIn.call();
      return;
    }

    final ret = await showConfirm(
        title: '로그인 하시겠습니까?'.tr(), message: '해당 서비스를 이용하시려면 로그인을 해야 합니다'.tr());
    if (ret == null || ret == false) {
      return;
    }

    final isLoggedIn = await router.push<bool>(const LoginRoute());
    if (isLoggedIn == true) {
      onLoggedIn.call();
    }
  }
}
