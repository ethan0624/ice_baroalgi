import 'package:event_bus/event_bus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/data/datasource/neis_api_client.dart';
import 'package:incheon_knowhow/data/repository/auth_repository_impl.dart';
import 'package:incheon_knowhow/data/repository/category_repository_impl.dart';
import 'package:incheon_knowhow/data/repository/course_repository_impl.dart';
import 'package:incheon_knowhow/data/repository/etc_repository_impl.dart';
import 'package:incheon_knowhow/data/repository/school_repository_impl.dart';
import 'package:incheon_knowhow/data/repository/search_repository_impl.dart';
import 'package:incheon_knowhow/data/repository/spot_repository_impl.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';
import 'package:incheon_knowhow/domain/repository/category_repository.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';
import 'package:incheon_knowhow/domain/repository/etc_repository.dart';
import 'package:incheon_knowhow/domain/repository/school_repository.dart';
import 'package:incheon_knowhow/domain/repository/search_repository.dart';
import 'package:incheon_knowhow/domain/repository/spot_repository.dart';
import 'package:incheon_knowhow/domain/usecase/auth/duplicate_email.dart';
import 'package:incheon_knowhow/domain/usecase/auth/find_user_id.dart';
import 'package:incheon_knowhow/domain/usecase/auth/get_user_info.dart';
import 'package:incheon_knowhow/domain/usecase/auth/login.dart';
import 'package:incheon_knowhow/domain/usecase/auth/regist_user.dart';
import 'package:incheon_knowhow/domain/usecase/auth/send_certification_code.dart';
import 'package:incheon_knowhow/domain/usecase/auth/update_password.dart';
import 'package:incheon_knowhow/domain/usecase/auth/update_school.dart';
import 'package:incheon_knowhow/domain/usecase/auth/withdraw.dart';
import 'package:incheon_knowhow/domain/usecase/category/find_recommend_categories.dart';
import 'package:incheon_knowhow/domain/usecase/category/find_region_categories.dart';
import 'package:incheon_knowhow/domain/usecase/category/find_topic_categories.dart';
import 'package:incheon_knowhow/domain/usecase/course/cancel_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/complete_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_course_in_progress.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_course_favorite.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_my_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_topic_with_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/get_course_info.dart';
import 'package:incheon_knowhow/domain/usecase/course/start_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/update_favorite.dart';
import 'package:incheon_knowhow/domain/usecase/etc/find_faq.dart';
import 'package:incheon_knowhow/domain/usecase/etc/find_notice.dart';
import 'package:incheon_knowhow/domain/usecase/etc/find_push.dart';
import 'package:incheon_knowhow/domain/usecase/etc/get_business_info.dart';
import 'package:incheon_knowhow/domain/usecase/etc/update_push_read.dart';
import 'package:incheon_knowhow/domain/usecase/school/find_school.dart';
import 'package:incheon_knowhow/domain/usecase/search/find_search.dart';
import 'package:incheon_knowhow/domain/usecase/spot/get_spot_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class Injection {
  static initialize() async {
    const secureStorage = FlutterSecureStorage(
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
    final sharedPreference = await SharedPreferences.getInstance();

    await _clearSecureStorageOnReinstall(
      prefs: sharedPreference,
      secureStorage: secureStorage,
    );

    final authProvider = AuthProvider(secureStorage: secureStorage)..initial();
    getIt.registerSingleton<AuthProvider>(authProvider);
    getIt.registerSingleton<ApiClient>(ApiClient(getIt()));
    getIt.registerSingleton<NeisApiClient>(NeisApiClient());
    getIt.registerSingleton<EventBus>(EventBus());

    // regist repository
    getIt.registerSingleton<SchoolRepository>(SchoolRepositoryImpl(
      apiClient: getIt(),
    ));
    getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(
      apiClient: getIt(),
    ));
    getIt.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(
      apiClient: getIt(),
    ));
    getIt.registerSingleton<CourseRepository>(CourseRepositoryImpl(
      apiClient: getIt(),
    ));
    getIt.registerSingleton<SpotRepository>(SpotRepositoryImpl(
      apiClient: getIt(),
    ));
    getIt.registerSingleton<EtcRepository>(EtcRepositoryImpl(
      apiClient: getIt(),
    ));
    getIt.registerSingleton<SearchRepository>(SearchRepositoryImpl(
      apiClient: getIt(),
    ));

    // regist usecase
    getIt.registerLazySingleton<FindSchool>(() => FindSchool(
          repository: getIt(),
        ));
    getIt.registerLazySingleton<FindUserId>(() => FindUserId(
          repository: getIt(),
        ));
    getIt.registerLazySingleton<DuplicateEmail>(() => DuplicateEmail(
          repository: getIt(),
        ));
    getIt.registerLazySingleton<SendCertificationCode>(
        () => SendCertificationCode(repository: getIt()));
    getIt.registerLazySingleton<UpdatePassword>(
        () => UpdatePassword(repository: getIt()));

    getIt.registerLazySingleton<Login>(() => Login(
          authProvider: getIt(),
          repository: getIt(),
        ));
    getIt.registerLazySingleton<GetUserInfo>(
      () => GetUserInfo(
        authProvider: getIt(),
        repository: getIt(),
      ),
    );
    getIt.registerLazySingleton<RegistUser>(
      () => RegistUser(repository: getIt()),
    );
    getIt.registerLazySingleton<Withdraw>(
      () => Withdraw(
        authProvider: getIt(),
        repository: getIt(),
      ),
    );
    getIt.registerLazySingleton<UpdateSchool>(
      () => UpdateSchool(
        authProvider: getIt(),
        repository: getIt(),
      ),
    );

    getIt.registerLazySingleton<FindTopicCategoreis>(
      () => FindTopicCategoreis(repository: getIt()),
    );
    getIt.registerLazySingleton<FindRegionCategoreis>(
      () => FindRegionCategoreis(repository: getIt()),
    );
    getIt.registerLazySingleton<FindRecommendCategoreis>(
      () => FindRecommendCategoreis(repository: getIt()),
    );
    getIt.registerLazySingleton<FindTopicWithCourse>(
      () => FindTopicWithCourse(repository: getIt()),
    );
    getIt.registerLazySingleton<FindCourseInProgress>(
      () => FindCourseInProgress(repository: getIt()),
    );
    getIt.registerLazySingleton<FindCourseFavorite>(
      () => FindCourseFavorite(repository: getIt()),
    );
    getIt.registerLazySingleton<FindCourse>(
      () => FindCourse(repository: getIt()),
    );
    getIt.registerLazySingleton<FindMyCourse>(
      () => FindMyCourse(repository: getIt()),
    );
    getIt.registerLazySingleton<GetCourseInfo>(
      () => GetCourseInfo(repository: getIt()),
    );
    getIt.registerLazySingleton<UpdateFavorite>(
      () => UpdateFavorite(
        authProvider: getIt(),
        repository: getIt(),
      ),
    );
    getIt.registerLazySingleton<StartCourse>(
      () => StartCourse(
        authProvider: getIt(),
        repository: getIt(),
      ),
    );
    getIt.registerLazySingleton<CompleteCourse>(
      () => CompleteCourse(
        authProvider: getIt(),
        repository: getIt(),
      ),
    );
    getIt.registerLazySingleton<CancelCourse>(
      () => CancelCourse(
        authProvider: getIt(),
        repository: getIt(),
      ),
    );

    getIt.registerLazySingleton<GetSpotInfo>(
      () => GetSpotInfo(repository: getIt()),
    );

    getIt.registerLazySingleton<FindNotice>(
      () => FindNotice(repository: getIt()),
    );
    getIt.registerLazySingleton<FindFaq>(
      () => FindFaq(repository: getIt()),
    );
    getIt.registerLazySingleton<GetBusinessInfo>(
      () => GetBusinessInfo(repository: getIt()),
    );
    getIt.registerLazySingleton<FindPush>(
      () => FindPush(
        authProvider: getIt(),
        repository: getIt(),
      ),
    );
    getIt.registerLazySingleton<UpdatePushRead>(
      () => UpdatePushRead(
        authProvider: getIt(),
        repository: getIt(),
      ),
    );
    getIt.registerLazySingleton<FindSearch>(
      () => FindSearch(
        repository: getIt(),
      ),
    );
  }

  static _clearSecureStorageOnReinstall({
    required SharedPreferences prefs,
    required FlutterSecureStorage secureStorage,
  }) async {
    String key = 'hasRunBefore';
    final hasRunBefore = prefs.getBool(key) ?? false;
    if (!hasRunBefore) {
      await secureStorage.deleteAll();
      prefs.setBool(key, true);
    }
  }
}
