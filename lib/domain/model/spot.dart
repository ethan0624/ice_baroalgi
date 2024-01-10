import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spot.g.dart';

@JsonSerializable()
class Spot {
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
  final bool? falg;

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
    this.falg,
  });

  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);

  Map<String, dynamic> toJson() => _$SpotToJson(this);
}

extension SpotExtension on Spot {
  bool get isFlag => falg == true;

  String get detailRoutePath => '/spot/$id';
}
