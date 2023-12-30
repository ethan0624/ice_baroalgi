import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:incheon_knowhow/config/app_config.dart';

part 'neis_api_client.g.dart';

@RestApi(baseUrl: 'https://open.neis.go.kr/hub')
abstract class NeisApiClient {
  factory NeisApiClient() {
    final dio = Dio();

    dio.options.connectTimeout =
        dio.options.receiveTimeout = AppConfig.apiTimeout;
    return _NeisApiClient(dio);
  }

  @GET('/schoolInfo')
  Future<String> findSchools(
    @Query('key') String key,
    @Query('pindex') int page,
    @Query('psize') int size,
    @Query('type') String type,
    @Query('SCHUL_NM') String? keyword,
  );
}
