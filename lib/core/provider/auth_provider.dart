import 'package:flutter/material.dart';
import 'package:incheon_knowhow/domain/model/user.dart';

class AuthProvider extends ChangeNotifier {
  String _accessToken = '';
  User? _user;

  String get accessToken => _accessToken;

  User? get userMe => _user;

  initial() async {
    await _load();
  }

  bool isAuthenticated() {
    return _user != null;
  }

  // 로그인 성공시 호출
  loggedIn({required User user}) async {
    _user = user;

    notifyListeners();
  }

  // 로그아웃시 호출
  logout() async {
    _user = null;

    notifyListeners();
  }

  _load() async {
    // todo
  }
}
