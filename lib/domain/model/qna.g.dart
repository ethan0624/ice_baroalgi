// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qna.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Qna _$QnaFromJson(Map<String, dynamic> json) => Qna(
      id: json['id'] as int,
      qustionTitle: json['qustionTitle'] as String,
      questionContent: json['question'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      isAnswer: json['state'] as bool,
      answerTitle: json['answerTitle'] as String?,
      answerContent: json['answer'] as String?,
      images:
          (json['fileUrl'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$QnaToJson(Qna instance) => <String, dynamic>{
      'id': instance.id,
      'qustionTitle': instance.qustionTitle,
      'question': instance.questionContent,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'state': instance.isAnswer,
      'answerTitle': instance.answerTitle,
      'answer': instance.answerContent,
      'fileUrl': instance.images,
    };
