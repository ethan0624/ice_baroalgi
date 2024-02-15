import 'package:dio/dio.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/model/faq_paging.dart';
import 'package:incheon_knowhow/domain/model/qna_paging.dart';
import 'package:incheon_knowhow/domain/model/search_result.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:incheon_knowhow/config/app_config.dart';
import 'package:incheon_knowhow/config/app_info.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/data/response/data_response.dart';
import 'package:incheon_knowhow/domain/model/business_info.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/model/find_id_result.dart';
import 'package:incheon_knowhow/domain/model/notice_paging.dart';
import 'package:incheon_knowhow/domain/model/push.dart';
import 'package:incheon_knowhow/domain/model/certification_code.dart';
import 'package:incheon_knowhow/domain/model/token.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:incheon_knowhow/domain/model/topic_course.dart';
import 'package:incheon_knowhow/domain/model/my_course.dart';

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

  // 회원 패스워드 찾기
  @POST('/user/findPw')
  Future<DataResponse<CertificationCode>> sendEmailCertificationCode(
    @Body() Map<String, dynamic> data,
  );

  // 이메일 중복체크
  @POST('/user/checkId')
  Future<DataResponse<String>> duplicateEmail(
    @Body() Map<String, dynamic> data,
  );

  // 비밀번호 체크
  @POST('/user/checkPw')
  Future<DataResponse<String>> checkPassword(
    @Body() Map<String, dynamic> data,
  );

  // 회원조회
  @GET('/user/info')
  Future<DataResponse<User>> getUserMe();

  // 회원 비밀번호 수정
  @PUT('/user/pw')
  Future<DataResponse<String>> updateUserPassword(
    @Body() Map<String, dynamic> data,
  );

  // 회원 전화번호 수정
  @PUT('/user/phone')
  Future<DataResponse<String>> updateUserPhone(
    @Body() Map<String, dynamic> data,
  );

  // 회원 학교 수정
  @PUT('/user/school')
  Future<DataResponse<String>> updateUserSchool(
    @Body() Map<String, dynamic> data,
  );

  // 진로 교육원 계정 연동
  @POST('/user/jinro')
  Future<DataResponse<String>> updateJinroAccount(
    @Body() Map<String, dynamic> data,
  );

  // 회원가입
  @POST('/register')
  Future<DataResponse<String>> register(
    @Body() Map<String, dynamic> data,
  );

  // 탈퇴
  @DELETE('/user')
  Future<DataResponse<String>> withdraw();

  /*
   * 코스 관련 
   */

  // 주제별 코스 조회
  @GET('/course/category')
  Future<DataResponse<List<TopicCourse>>> findTopicCourse();

  // 코스 목록 조회
  @GET('/course')
  Future<DataResponse<List<Course>>> findCourse(
    @Body() Map<String, dynamic> data,
  );

  // 정복중인 코스 목록 조회
  @GET('/course/ing')
  Future<DataResponse<List<Course>>> findCourseInProgress();

  // 찜하기한 코스 목록 조회
  @GET('/course/wishlist')
  Future<DataResponse<List<Course>>> findCourseWish();

  // 나의 코스 조회
  @GET('/course/info')
  Future<DataResponse<MyCourse>> myCourse();

  // 코스 상세 정보 조회
  @GET('/course/{id}')
  Future<DataResponse<Course>> getCourseInfo(@Path() int id);

  // 코스 찜하기
  @POST('/course/wishlist/{id}')
  Future<DataResponse<String>> updagteFavorite(@Path() int id);

  // 코스 시작하기(정복하기)
  @POST('/course/start/{id}')
  Future<DataResponse<String>> startCourse(@Path() int id);

  // 코스 종료하기
  @POST('/course/end/{id}')
  Future<DataResponse<String>> completedCourse(@Path() int id);

  // 코스 진행 중단하기
  @POST('/course/stop/{id}')
  Future<DataResponse<String>> cancelCourse(@Path() int id);

  // 코스 스탬프 발행하기
  @POST('/course/stamp/{id}')
  Future<DataResponse<String>> saveStamp(
    @Path() int id,
    @Body() Map<String, dynamic> data,
  );

  /*
   * 스팟 
   */
  // 스팟 상세 정보 조회
  @GET('/spot/{id}')
  Future<DataResponse<Spot>> getSpotInfo(@Path() int id);

  // 스팟 깃발 등록하기
  @POST('/spot/flag/{id}')
  Future<DataResponse<String>> setSpotFlag(@Path() int id);

  /*
   * 기타  
   */

  // 공지사항 조회
  @GET('/notice')
  Future<DataResponse<NoticePaging>> findNotice();

  // 자주묻는 질문 조회
  @GET('/faq')
  Future<DataResponse<FaqPaging>> findFaq();

  // 1:1 문의 조회
  @GET('/category/qna')
  Future<DataResponse<List<Category>>> findQnaCategory();

  // 1:1 문의 조회
  @GET('/qna')
  Future<DataResponse<QnaPaging>> findQna();

  @POST('/qna')
  Future<DataResponse<String>> saveQna(
    @Body() Map<String, dynamic> data,
  );

  // 사업자정보 조회
  @GET('/client/info')
  Future<DataResponse<BusinessInfo>> getBusinessInfo();

  // 알림 조회
  @GET('/push')
  Future<DataResponse<List<Push>>> findPush();

  // 알림 읽음 처리
  @POST('/push/{id}')
  Future<DataResponse<String>> updatePush(@Path() int id);

  // 검색
  @GET('/search')
  Future<DataResponse<SearchResult>> search(
    @Body() Map<String, dynamic> data,
  );
}
