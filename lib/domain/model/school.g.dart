// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

School _$SchoolFromJson(Map<String, dynamic> json) => School(
      name: json['SCHUL_NM'] as String,
      engName: json['ENG_SCHUL_NM'] as String,
      organizationName: json['JU_ORG_NM'] as String,
    );

Map<String, dynamic> _$SchoolToJson(School instance) => <String, dynamic>{
      'SCHUL_NM': instance.name,
      'ENG_SCHUL_NM': instance.engName,
      'JU_ORG_NM': instance.organizationName,
    };
