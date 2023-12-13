// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      id: json['id'] as int,
      title: json['title'] as String,
      duration: json['duration'] as String,
      distance: json['distance'] as String,
      images: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      isLiked: json['wishlist'] as bool? ?? false,
      spotCount: json['spot'] as int? ?? 0,
      completedSpotCount: json['completeSpot'] as int? ?? 0,
      region: json['region'] as String?,
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
      'image': instance.images,
      'wishlist': instance.isLiked,
      'spot': instance.spotCount,
      'completeSpot': instance.completedSpotCount,
      'region': instance.region,
      'summary': instance.summary,
      'descript': instance.description,
      'spots': instance.spots,
    };
