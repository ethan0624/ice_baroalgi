import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/data/datasource/neis_api_client.dart';
import 'package:incheon_knowhow/data/repository/auth_repository_impl.dart';
import 'package:incheon_knowhow/data/repository/category_repository_impl.dart';
import 'package:incheon_knowhow/data/repository/course_repository_impl.dart';
import 'package:incheon_knowhow/data/repository/school_repository_impl.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';
import 'package:incheon_knowhow/domain/repository/category_repository.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';
import 'package:incheon_knowhow/domain/repository/school_repository.dart';
import 'package:incheon_knowhow/domain/usecase/auth/find_user_id.dart';
import 'package:incheon_knowhow/domain/usecase/auth/get_user_info.dart';
import 'package:incheon_knowhow/domain/usecase/auth/login.dart';
import 'package:incheon_knowhow/domain/usecase/auth/regist_user.dart';
import 'package:incheon_knowhow/domain/usecase/category/find_recommend_categories.dart';
import 'package:incheon_knowhow/domain/usecase/category/find_region_categories.dart';
import 'package:incheon_knowhow/domain/usecase/category/find_topic_categories.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/get_course_info.dart';
import 'package:incheon_knowhow/domain/usecase/school/find_school.dart';
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

    // regist usecase
    getIt.registerLazySingleton<FindSchool>(() => FindSchool(
          repository: getIt(),
        ));
    getIt.registerLazySingleton<FindUserId>(() => FindUserId(
          repository: getIt(),
        ));
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

    getIt.registerLazySingleton<FindTopicCategoreis>(
      () => FindTopicCategoreis(repository: getIt()),
    );
    getIt.registerLazySingleton<FindRegionCategoreis>(
      () => FindRegionCategoreis(repository: getIt()),
    );
    getIt.registerLazySingleton<FindRecommendCategoreis>(
      () => FindRecommendCategoreis(repository: getIt()),
    );
    getIt.registerLazySingleton<FindCourse>(
      () => FindCourse(repository: getIt()),
    );
    getIt.registerLazySingleton<GetCourseInfo>(
      () => const GetCourseInfo(),
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
