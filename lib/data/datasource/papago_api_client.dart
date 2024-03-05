import 'package:dio/dio.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/data/response/papago_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:incheon_knowhow/config/app_config.dart';

part 'papago_api_client.g.dart';

@RestApi(baseUrl: 'https://naveropenapi.apigw.gov-ntruss.com/nmt/v1')
abstract class PapagoApiClient {
  factory PapagoApiClient() {
    final dio = Dio();

    dio.options.connectTimeout =
        dio.options.receiveTimeout = AppConfig.apiTimeout;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
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
    if (!isRelease) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        maxWidth: 500,
      ));
    }

    return _PapagoApiClient(dio);
  }

  @POST('/translation')
  Future<PapagoResponse> translation(
    @Body() Map<String, dynamic> data,
  );
}
