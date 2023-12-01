import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:incheon_knowhow/domain/enum/user_type.dart';

class JoinData {
  final UserType type;
  final bool isFourteenOver;

  final bool? isAgreedLocation;

  final String? userCI;
  final String? userName;
  final String? userBirthday;
  final UserGenderType? userGender;
  final String? userPhoneNumber;

  const JoinData({
    required this.type,
    required this.isFourteenOver,
    this.isAgreedLocation,
    this.userCI,
    this.userName,
    this.userBirthday,
    this.userGender,
    this.userPhoneNumber,
  });

  copyWith({
    bool? isAgreedLocation,
    String? userCI,
    String? userName,
    String? userBirthday,
    UserGenderType? userGender,
    String? userPhoneNumber,
  }) {
    return JoinData(
      type: type,
      isFourteenOver: isFourteenOver,
      isAgreedLocation: isAgreedLocation ?? this.isAgreedLocation,
      userCI: userCI ?? this.userCI,
      userName: userName ?? this.userName,
      userBirthday: userBirthday ?? this.userBirthday,
      userGender: userGender ?? this.userGender,
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
    );
  }
}
