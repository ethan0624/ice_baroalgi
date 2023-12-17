import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:incheon_knowhow/domain/enum/user_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'type', unknownEnumValue: UserType.student)
  final UserType type;
  @JsonKey(name: 'gender', unknownEnumValue: UserGenderType.male)
  final UserGenderType genderType;
  @JsonKey(name: 'school')
  final String? schoolName;
  @JsonKey(name: 'grade')
  final int? grade;
  @JsonKey(name: 'class')
  final int? group;
  @JsonKey(name: 'jinroEmail')
  final String? jinroAccountEmail;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    required this.genderType,
    this.schoolName,
    this.grade,
    this.group,
    this.jinroAccountEmail,
  });

  factory User.tester() {
    return const User(
      id: '1',
      name: 'tester',
      email: 'test@test.co.kr',
      phone: '010-1234-5678',
      type: UserType.student,
      genderType: UserGenderType.male,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
