// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qna_paging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QnaPaging _$QnaPagingFromJson(Map<String, dynamic> json) => QnaPaging(
      rows: (json['qnas'] as List<dynamic>)
          .map((e) => Qna.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );

Map<String, dynamic> _$QnaPagingToJson(QnaPaging instance) => <String, dynamic>{
      'qnas': instance.rows,
      'total': instance.total,
    };
