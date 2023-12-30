// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicCourse _$TopicCourseFromJson(Map<String, dynamic> json) => TopicCourse(
      id: json['id'] as int,
      title: json['title'] as String,
      courses: (json['coursedata'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopicCourseToJson(TopicCourse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'coursedata': instance.courses,
    };
