// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolResponse _$SchoolResponseFromJson(Map<String, dynamic> json) =>
    SchoolResponse(
      infos: (json['schoolInfo'] as List<dynamic>)
          .map((e) => SchoolInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchoolResponseToJson(SchoolResponse instance) =>
    <String, dynamic>{
      'schoolInfo': instance.infos,
    };
