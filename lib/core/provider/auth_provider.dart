import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:incheon_knowhow/domain/model/token.dart';
import 'package:incheon_knowhow/domain/model/user.dart';

class AuthProvider extends ChangeNotifier {
  final FlutterSecureStorage secureStorage;
  final _tokenPrefsKey = 'key_user_token';
  AuthProvider({
    required this.secureStorage,
  });

  Token? _token;
  User? _user;

  String get accessToken => _token?.accessToken ?? '';

  User? get userMe => _user;

  // 로그인 사용자 중 진로 연동을 완료하지 않거나 건너뛰기 하지 않은 경우
  bool get skipJinroAccountRegist =>
      userMe?.jinroAccountEmail?.isNotEmpty ?? true;

  initial() async {
    await _load();
  }

  bool hasToken() {
    return _token != null;
  }

  bool isAuthenticated() {
    return hasToken() && _user != null;
  }

  // 로그인 성공시 호출
  loggedIn({required Token token, required User user}) async {
    _token = token;
    _user = user;

    await secureStorage.write(key: _tokenPrefsKey, value: token.serialize());

    notifyListeners();
  }

  updateToken({required Token token}) async {
    _token = token;

    await secureStorage.write(key: _tokenPrefsKey, value: token.serialize());

    notifyListeners();
  }

  updateUser({required User user}) async {
    _user = user;

    notifyListeners();
  }

  // 로그아웃시 호출
  logout() async {
    _token = null;
    _user = null;

    await secureStorage.delete(key: _tokenPrefsKey);

    notifyListeners();
  }

  _load() async {
    try {
      final tokenJsonString =
          (await secureStorage.read(key: _tokenPrefsKey)) ?? '';

      if (tokenJsonString.isEmpty) return;

      _token = Token.deserialize(tokenJsonString);
    } catch (e, s) {
      debugPrint('>>>>> auth load fail : $e / $s');
    }
  }
}
