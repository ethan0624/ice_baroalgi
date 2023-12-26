// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolInfo _$SchoolInfoFromJson(Map<String, dynamic> json) => SchoolInfo(
      pages: (json['head'] as List<dynamic>)
          .map((e) => SchoolPage.fromJson(e as Map<String, dynamic>))
          .toList(),
      rows: (json['row'] as List<dynamic>)
          .map((e) => School.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchoolInfoToJson(SchoolInfo instance) =>
    <String, dynamic>{
      'head': instance.pages,
      'row': instance.rows,
    };
