import 'package:incheon_knowhow/config/constrants.dart';

class AppConfig {
  static const String appScheme = '';

  static const String baseUrl = isRelease
      ? 'https://iceapp.ice-baroalgi.kr'
      : 'https://iceapp.ice-baroalgi.kr';
  static const String apiBaseUrl = '$baseUrl/api/v1';
  static const Duration apiTimeout = Duration(seconds: 20);

  // iamport(port one)
  static const String iamportUserCode = 'imp52326373';
  static const String iamportCompany = '인천바로알기';
  static const String iamportApiUrl = 'https://api.iamport.kr';
  static const String iamportApiKey = '8885445870101137';
  static const String iamportApiSecret =
      'wWe46OF9p1d7yDGdXhXEbATNtwLwGc8oeEoitaMRK8eG7s1oWrlhe8IdVimsp5Ai6ud7N8vq6sh0DxLH';

  // open neis (나이스 교육정보 개방 포털)
  static const String openNeisApiKey = '905ffa25d86a44e689bbd3958680c6d0';

  // naver map api
  static const String naverMapClientId = 'a9a4j3mx6l';

  // naver papago api
  static const String naverClientId = '1k4ip6d92p';
  static const String naverClientSecretKey =
      'hHif8DKjW5r81BTiRK91x6dhRjCQ7qly75bKJyDS';
}
