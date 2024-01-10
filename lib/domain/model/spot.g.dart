// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spot _$SpotFromJson(Map<String, dynamic> json) => Spot(
      id: json['id'] as int,
      title: json['title'] as String,
      address: json['address'] as String?,
      summary: json['summary'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      image: json['image'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['descript'] as String?,
      tel: json['tel'] as String?,
      openTime: json['openTime'] as String?,
      dayOff: json['dayOff'] as String?,
      includeCourse: (json['SpotToCourses'] as List<dynamic>?)
          ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
          .toList(),
      falg: json['flag'] as bool?,
    );

Map<String, dynamic> _$SpotToJson(Spot instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'image': instance.image,
      'images': instance.images,
      'summary': instance.summary,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'descript': instance.description,
      'tel': instance.tel,
      'openTime': instance.openTime,
      'dayOff': instance.dayOff,
      'SpotToCourses': instance.includeCourse,
      'flag': instance.falg,
    };
