// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

extension StringExtension on String {
  // 5~50자의 영문 대/소문자, 숫자, 특수문자(_,-)만 사용 가능
  bool isValidId() {
    final regex = RegExp(r'^[a-zA-Z0-9_-]{5,50}$');
    return regex.hasMatch(this);
  }

  // 8~40자의 영문, 숫자를 포함
  bool isValidPassword() {
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,40}$');
    return regex.hasMatch(this);
  }

  bool isValidEmail() {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(this);
  }

  bool isPhoneNumber() {
    // 대한민국 휴대폰 기준
    final regex = RegExp(r'^01[0-9]\d{3,4}\d{4}$');
    return regex.hasMatch(this);
  }

  //영문 포함여부
  bool hasAlphabet() {
    final regex = RegExp(r'[a-zA-Z]');
    return regex.hasMatch(this);
  }

  // 숫자 포함여부
  bool hasNumber() {
    final regex = RegExp(r'\d');
    return regex.hasMatch(this);
  }

  String ext() {
    return p.extension(this).toLowerCase();
  }
}
