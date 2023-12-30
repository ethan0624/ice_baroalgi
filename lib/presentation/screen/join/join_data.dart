import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:incheon_knowhow/domain/enum/user_type.dart';

class JoinData {
  final UserType type;
  final bool isFourteenOver;

  final bool isAgreedMinor;
  final bool isAgreedLocation;

  // 본인 정보
  final String? userCI;
  final String? userName;
  final String? userBirthday;
  final UserGenderType? userGender;
  final String? userPhoneNumber;

  // 보호자 정보
  final String? parentCI;
  final String? parentName;
  final String? parentBirthday;
  final UserGenderType? parentGender;
  final String? parentPhoneNumber;

  const JoinData({
    required this.type,
    required this.isFourteenOver,
    this.isAgreedMinor = false,
    this.isAgreedLocation = false,
    this.userCI,
    this.userName,
    this.userBirthday,
    this.userGender,
    this.userPhoneNumber,
    this.parentCI,
    this.parentName,
    this.parentBirthday,
    this.parentGender,
    this.parentPhoneNumber,
  });

  copyWith({
    bool? isAgreedMinor,
    bool? isAgreedLocation,
    String? userCI,
    String? userName,
    String? userBirthday,
    UserGenderType? userGender,
    String? userPhoneNumber,
    String? parentCI,
    String? parentName,
    String? parentBirthday,
    UserGenderType? parentGender,
    String? parentPhoneNumber,
  }) {
    return JoinData(
      type: type,
      isFourteenOver: isFourteenOver,
      isAgreedMinor: isAgreedMinor ?? this.isAgreedMinor,
      isAgreedLocation: isAgreedLocation ?? this.isAgreedLocation,
      userCI: userCI ?? this.userCI,
      userName: userName ?? this.userName,
      userBirthday: userBirthday ?? this.userBirthday,
      userGender: userGender ?? this.userGender,
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
      parentCI: parentCI ?? this.parentCI,
      parentName: parentName ?? this.parentName,
      parentBirthday: parentBirthday ?? this.parentBirthday,
      parentGender: parentGender ?? this.parentGender,
      parentPhoneNumber: parentPhoneNumber ?? this.parentPhoneNumber,
    );
  }
}
