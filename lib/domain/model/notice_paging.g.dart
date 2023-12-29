// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_paging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticePaging _$NoticePagingFromJson(Map<String, dynamic> json) => NoticePaging(
      notices: (json['notices'] as List<dynamic>)
          .map((e) => Notice.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );

Map<String, dynamic> _$NoticePagingToJson(NoticePaging instance) =>
    <String, dynamic>{
      'notices': instance.notices,
      'total': instance.total,
    };
