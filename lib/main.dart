import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:incheon_knowhow/app.dart';
import 'package:incheon_knowhow/config/app_config.dart';
import 'package:incheon_knowhow/config/app_info.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/data/my_http_override.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await EasyLocalization.ensureInitialized();

    // ignore HandshakeException
    HttpOverrides.global = MyHttpOverride();

    await NaverMapSdk.instance.initialize(
      clientId: AppConfig.naverMapClientId,
      onAuthFailed: (error) {
        debugPrint("********* 네이버맵 인증오류 : $error *********");
      },
    );

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    await AppInfo.initialize();
    await Injection.initialize();

    runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('ko', 'KR'),
          Locale('en', 'US'),
          Locale('ru', 'RU'),
          Locale('vi', 'VN'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('ko', 'KR'),
        child: const App(),
      ),
    );
  }, (error, stack) {
    debugPrint('>>>> error : $error, $stack');
  });
}
