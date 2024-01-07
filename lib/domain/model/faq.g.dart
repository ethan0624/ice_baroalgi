// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faq _$FaqFromJson(Map<String, dynamic> json) => Faq(
      id: json['id'] as int,
      categoryId: json['fcategoryId'] as int,
      categoryName: json['fcategoryName'] as String,
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$FaqToJson(Faq instance) => <String, dynamic>{
      'id': instance.id,
      'fcategoryId': instance.categoryId,
      'fcategoryName': instance.categoryName,
      'question': instance.question,
      'answer': instance.answer,
    };
