// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int,
      title: json['title'] as String,
      duration: json['duration'] as String?,
      distance: json['distance'] as String?,
      image: json['image'] as String?,
      isLiked: json['wishlist'] as bool? ?? false,
      isCompleted: json['courseState'] as bool? ?? false,
      spotCount: json['spotCount'] as int? ?? 0,
      completedSpotCount: json['completeSpot'] as int? ?? 0,
      regionId: json['regionId'] as int?,
      regionName: json['region'] as String?,
      summary: json['summary'] as String?,
      description: json['descript'] as String?,
      spots: (json['spots'] as List<dynamic>?)
          ?.map((e) => Spot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'distance': instance.distance,
      'image': instance.image,
      'wishlist': instance.isLiked,
      'courseState': instance.isCompleted,
      'spotCount': instance.spotCount,
      'completeSpot': instance.completedSpotCount,
      'regionId': instance.regionId,
      'region': instance.regionName,
      'summary': instance.summary,
      'descript': instance.description,
      'spots': instance.spots,
    };
