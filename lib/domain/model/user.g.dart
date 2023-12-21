// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      type: json['type'] as String,
      genderType: $enumDecode(_$UserGenderTypeEnumMap, json['gender'],
          unknownValue: UserGenderType.male),
      schoolName: json['school'] as String?,
      grade: json['grade'] as int?,
      group: json['class'] as int?,
      jinroAccountEmail: json['jinroEmail'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
      'gender': _$UserGenderTypeEnumMap[instance.genderType]!,
      'school': instance.schoolName,
      'grade': instance.grade,
      'class': instance.group,
      'jinroEmail': instance.jinroAccountEmail,
    };

const _$UserGenderTypeEnumMap = {
  UserGenderType.male: 'm',
  UserGenderType.female: 'f',
};
