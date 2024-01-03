// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spot _$SpotFromJson(Map<String, dynamic> json) => Spot(
      id: json['id'] as int,
      title: json['title'] as String,
      address: json['address'] as String,
      summary: json['summary'] as String?,
      image: json['image'] as String?,
      description: json['descript'] as String?,
      tel: json['tel'] as String?,
      openTime: json['openTime'] as String?,
      dayOff: json['dayOff'] as String?,
    );

Map<String, dynamic> _$SpotToJson(Spot instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'image': instance.image,
      'summary': instance.summary,
      'descript': instance.description,
      'tel': instance.tel,
      'openTime': instance.openTime,
      'dayOff': instance.dayOff,
    };
