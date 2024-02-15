import 'package:dio/dio.dart';
import 'package:incheon_knowhow/data/response/papago_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:incheon_knowhow/config/app_config.dart';

part 'papago_api_client.g.dart';

// @RestApi(baseUrl: 'https://openapi.naver.com/v1')
@RestApi(baseUrl: 'https://naveropenapi.apigw.ntruss.com')
abstract class PapagoApiClient {
  factory PapagoApiClient() {
    final dio = Dio();

    dio.options.connectTimeout =
        dio.options.receiveTimeout = AppConfig.apiTimeout;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // options.headers['X-Naver-Client-Id'] = AppConfig.naverClientId;
          // options.headers['X-Naver-Client-Secret'] =
          //     AppConfig.naverClientSecretKey;

          options.headers['X-NCP-APIGW-API-KEY-ID'] = AppConfig.naverClientId;
          options.headers['X-NCP-APIGW-API-KEY'] =
              AppConfig.naverClientSecretKey;

          return handler.next(options);
        },
        onError: (error, handler) async {
          return handler.next(error);
        },
      ),
    );
    return _PapagoApiClient(dio);
  }

  // @POST('/papago/n2mt')
  @POST('/nmt/v1/translation')
  Future<PapagoResponse> translation(
    @Body() Map<String, dynamic> data,
  );
}
