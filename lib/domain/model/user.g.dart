// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      genderType: $enumDecode(_$UserGenderTypeEnumMap, json['gender'],
          unknownValue: UserGenderType.male),
      type: $enumDecodeNullable(_$UserTypeEnumMap, json['type'],
          unknownValue: UserType.other),
      birth: json['birth'] as String?,
      schoolName: json['school'] as String?,
      grade: json['grade'] as int?,
      group: json['class'] as String?,
      jinroAccountEmail: json['jinroEmail'] as String?,
      isPushNotification: json['pushState'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': _$UserGenderTypeEnumMap[instance.genderType]!,
      'type': _$UserTypeEnumMap[instance.type],
      'birth': instance.birth,
      'school': instance.schoolName,
      'grade': instance.grade,
      'class': instance.group,
      'jinroEmail': instance.jinroAccountEmail,
      'pushState': instance.isPushNotification,
    };

const _$UserGenderTypeEnumMap = {
  UserGenderType.male: 'm',
  UserGenderType.female: 'f',
};

const _$UserTypeEnumMap = {
  UserType.student: '학생',
  UserType.other: '일반인',
};
