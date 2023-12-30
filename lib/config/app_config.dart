import 'package:incheon_knowhow/config/constrants.dart';

class AppConfig {
  static const String appScheme = '';
  static const String naverMapClientId = 'uihnwow7tv';

  static const String baseUrl = isRelease
      ? 'https://ice.co.kr'
      : 'https://ec2-54-174-12-34.compute-1.amazonaws.com';
  static const String apiBaseUrl = '$baseUrl/api/v1';
  static const Duration apiTimeout = Duration(seconds: 20);

  // iamport(port one)
  static const String iamportUserCode = 'imp52326373';
  static const String iamportCompany = '인천바로알기';

  // open neis (나이스 교육정보 개방 포털)
  static const String openNeisApiKey = '905ffa25d86a44e689bbd3958680c6d0';
}
