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
      type: json['type'] as String?,
      schoolName: json['school'] as String?,
      grade: json['grade'] as int?,
      group: json['class'] as String?,
      jinroAccountEmail: json['jinroEmail'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': _$UserGenderTypeEnumMap[instance.genderType]!,
      'type': instance.type,
      'school': instance.schoolName,
      'grade': instance.grade,
      'class': instance.group,
      'jinroEmail': instance.jinroAccountEmail,
    };

const _$UserGenderTypeEnumMap = {
  UserGenderType.male: 'm',
  UserGenderType.female: 'f',
};
