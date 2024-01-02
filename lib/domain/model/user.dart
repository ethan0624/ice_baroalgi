import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'gender', unknownEnumValue: UserGenderType.male)
  final UserGenderType genderType;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'school')
  final String? schoolName;
  @JsonKey(name: 'grade')
  final int? grade;
  @JsonKey(name: 'class')
  final String? group;
  @JsonKey(name: 'jinroEmail')
  final String? jinroAccountEmail;
  // @JsonKey(name: 'pushState')
  // final bool? isPushNotification;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.genderType,
    this.type,
    this.schoolName,
    this.grade,
    this.group,
    this.jinroAccountEmail,
    // this.isPushNotification,
  });

  factory User.tester() {
    return const User(
      id: 1,
      name: 'tester',
      email: 'test@test.co.kr',
      phone: '010-1234-5678',
      type: '일반인',
      genderType: UserGenderType.male,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

extension UserExtension on User {
  String get schoolInfo {
    if (schoolName?.isNotEmpty == true && grade != null && group != null) {
      return '$schoolName $grade학년 $group반';
    } else {
      return '';
    }
  }
}
