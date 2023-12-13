import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'duration')
  final String duration; //  분
  @JsonKey(name: 'distance')
  final String distance; //  km
  @JsonKey(name: 'image')
  final List<String> images;
  @JsonKey(name: 'wishlist')
  final bool isLiked;
  @JsonKey(name: 'spot')
  final int spotCount;
  @JsonKey(name: 'completeSpot')
  final int completedSpotCount;

  // 상세정보
  @JsonKey(name: 'region')
  final String? region;
  @JsonKey(name: 'summary')
  final String? summary;
  @JsonKey(name: 'descript')
  final String? description;
  @JsonKey(name: 'spots')
  final List<Spot>? spots;

  const Course({
    required this.id,
    required this.title,
    required this.duration,
    required this.distance,
    required this.images,
    this.isLiked = false,
    this.spotCount = 0,
    this.completedSpotCount = 0,
    this.region,
    this.summary,
    this.description,
    this.spots,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
