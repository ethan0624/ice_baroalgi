import 'package:get_it/get_it.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class Injection {
  static initialize() async {
    // final sharedPreference = await SharedPreferences.getInstance();
    final authProvider = AuthProvider()..initial();
    getIt.registerSingleton<AuthProvider>(authProvider);
  }
}
