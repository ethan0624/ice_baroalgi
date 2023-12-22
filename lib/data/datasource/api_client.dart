import 'package:dio/dio.dart';
import 'package:incheon_knowhow/domain/model/find_id_result.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/data/response/data_response.dart';
import 'package:incheon_knowhow/domain/model/certification_code.dart';
import 'package:incheon_knowhow/domain/model/token.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:incheon_knowhow/config/app_config.dart';
import 'package:incheon_knowhow/config/app_info.dart';
import 'package:incheon_knowhow/config/constrants.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(AuthProvider authProvider) {
    final appInfo = AppInfo();
    final dio = Dio();

    dio.options.baseUrl = AppConfig.apiBaseUrl;
    dio.options.connectTimeout =
        dio.options.receiveTimeout = AppConfig.apiTimeout;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['x-client-context'] = appInfo.userAgent;
          options.headers['x-app-version'] = appInfo.appVersion;

          if (authProvider.accessToken.isNotEmpty) {
            options.headers['token'] = authProvider.accessToken;
          }

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
    return _ApiClient(dio);
  }

  // 로그인(엑세스 토큰 발급)
  @POST('/login')
  Future<DataResponse<Token>> login(
    @Body() Map<String, dynamic> data,
  );

  // 회원 아이디 찾기
  @POST('/user/findId')
  Future<DataResponse<FindIdResult>> findUserId(
    @Body() Map<String, dynamic> data,
  );

  // 회원조회
  @GET('/user/info')
  Future<DataResponse<User>> getUserMe();

  /// todo:

  // 회원가입
  @POST('/register')
  Future<DataResponse<String>> register(
    @Body() Map<String, dynamic> data,
  );

  // 회원 비밀번호 수정
  @PUT('/user/pw/:id')
  Future<DataResponse<String>> updateUserPassword(
    @Path() int id,
    @Body() Map<String, dynamic> data,
  );

  // 회원 전화번호 수정
  @PUT('/user/phone/:id')
  Future<DataResponse<String>> updateUserPhone(
    @Path() int id,
    @Body() Map<String, dynamic> data,
  );

  // 회원 학교 수정
  @PUT('/user/school/:id')
  Future<DataResponse<String>> updateUserSchool(
    @Path() int id,
    @Body() Map<String, dynamic> data,
  );

  // 회원 학교 수정
  @PUT('/user/jinro/:id')
  Future<DataResponse<String>> updateJinroAccount(
    @Path() int id,
    @Body() Map<String, dynamic> data,
  );

  // 탈퇴
  @DELETE('/user/:id')
  Future<DataResponse<String>> withdraw(
    @Path() int id,
  );

  // 회원 패스워드 찾기
  @POST('/user/findPw')
  Future<DataResponse<CertificationCode>> sendEmailCertificationCode(
    @Body() Map<String, dynamic> data,
  );
}
