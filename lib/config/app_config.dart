import 'package:incheon_knowhow/config/constrants.dart';

class AppConfig {
  static const String appScheme = '';
  static const String naverMapClientId = 'uihnwow7tv';

  static const String baseUrl =
      isRelease ? 'https://ice.co.kr' : 'https://device.co.kr';
  static const String apiBaseUrl = '$baseUrl/api/v1';
  static const Duration apiTimeout = Duration(seconds: 30);
}
