import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/usecase/auth/get_user_info.dart';
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

    getIt.registerLazySingleton<GetUserInfo>(() => const GetUserInfo());
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
