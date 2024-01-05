// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_paging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqPaging _$FaqPagingFromJson(Map<String, dynamic> json) => FaqPaging(
      faqs: (json['fqas'] as List<dynamic>)
          .map((e) => Faq.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );

Map<String, dynamic> _$FaqPagingToJson(FaqPaging instance) => <String, dynamic>{
      'fqas': instance.faqs,
      'total': instance.total,
    };
