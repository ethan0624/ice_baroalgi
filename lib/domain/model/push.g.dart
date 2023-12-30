// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Push _$PushFromJson(Map<String, dynamic> json) => Push(
      id: json['id'] as int,
      title: json['title'] as String,
      isRead: json['state'] as bool,
      receivedDateString: json['received_at'] as String,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$PushToJson(Push instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'state': instance.isRead,
      'received_at': instance.receivedDateString,
    };
