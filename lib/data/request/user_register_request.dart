import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:incheon_knowhow/domain/enum/user_type.dart';

class UserRegisterRequest {
  final UserType type;
  final String email;
  final String password;
  final String name;
  final UserGenderType gender;
  final String birth;
  final String phone;
  final bool isFourteenOver; // 미성년자(14세 이하)
  final bool isAgreedMinor;
  final bool isAgreedGps;
  final String? schoolName;
  final String? schoolGrade;
  final String? schoolClass;
  // 보호자 정보
  final String? parentName;
  final String? parentBirth;
  final UserGenderType? parentGender;
  final String? parentPhone;

  const UserRegisterRequest({
    required this.type,
    required this.email,
    required this.password,
    required this.name,
    required this.gender,
    required this.birth,
    required this.phone,
    required this.isFourteenOver,
    required this.isAgreedMinor,
    required this.isAgreedGps,
    this.schoolName,
    this.schoolGrade,
    this.schoolClass,
    this.parentName,
    this.parentBirth,
    this.parentGender,
    this.parentPhone,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'gender': gender.value,
      'birth': birth,
      'phone': phone.replaceAll('-', ''),
      'type': type.value,
      'school': schoolName,
      'grade': schoolGrade,
      'class': schoolClass,
      'cyberjinro': false,
      'minor': !isFourteenOver,
      'nokName': parentName,
      'nokBirth': parentBirth,
      'nokGender': parentGender?.value,
      'nokPhone': parentPhone,
      'agreeMinor': isAgreedMinor,
      'agreeGps': isAgreedGps,
    };
  }
}
