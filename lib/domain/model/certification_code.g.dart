// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certification_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificationCode _$CertificationCodeFromJson(Map<String, dynamic> json) =>
    CertificationCode(
      code: json['code'] as String,
      userId: json['id'] as int,
    );

Map<String, dynamic> _$CertificationCodeToJson(CertificationCode instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.userId,
    };
