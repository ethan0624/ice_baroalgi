// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCourse _$MyCourseFromJson(Map<String, dynamic> json) => MyCourse(
      inProgressCourse: (json['readyCourse'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      completedCourse: (json['finishCourse'] as List<dynamic>)
          .map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyCourseToJson(MyCourse instance) => <String, dynamic>{
      'readyCourse': instance.inProgressCourse,
      'finishCourse': instance.completedCourse,
    };
