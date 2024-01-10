import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spot.g.dart';

@JsonSerializable()
class Spot extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'summary')
  final String? summary;
  @JsonKey(name: 'latitude')
  final double? latitude;
  @JsonKey(name: 'longitude')
  final double? longitude;
  @JsonKey(name: 'descript')
  final String? description;
  @JsonKey(name: 'tel')
  final String? tel;
  @JsonKey(name: 'openTime')
  final String? openTime;
  @JsonKey(name: 'dayOff')
  final String? dayOff;
  @JsonKey(name: 'SpotToCourses')
  final List<Course>? includeCourse;
  @JsonKey(name: 'flag')
  final bool? flag;

  const Spot({
    required this.id,
    required this.title,
    this.address,
    this.summary,
    this.latitude,
    this.longitude,
    this.image,
    this.images,
    this.description,
    this.tel,
    this.openTime,
    this.dayOff,
    this.includeCourse,
    this.flag,
  });

  copyWith({
    bool? flag,
  }) {
    return Spot(
      id: id,
      title: title,
      address: address,
      summary: summary,
      latitude: latitude,
      longitude: longitude,
      image: image,
      images: images,
      description: description,
      tel: tel,
      openTime: openTime,
      dayOff: dayOff,
      includeCourse: includeCourse,
      flag: flag ?? this.flag,
    );
  }

  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);

  Map<String, dynamic> toJson() => _$SpotToJson(this);

  @override
  List<Object?> get props => [id, title, address, latitude, longitude, flag];
}

extension SpotExtension on Spot {
  bool get isFlag => flag == true;

  String get detailRoutePath => '/spot/$id';
}
