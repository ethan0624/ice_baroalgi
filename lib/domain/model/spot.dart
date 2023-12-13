import 'package:json_annotation/json_annotation.dart';

part 'spot.g.dart';

@JsonSerializable()
class Spot {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'address')
  final String address;
  @JsonKey(name: 'image')
  final List<String> images;
  @JsonKey(name: 'summary')
  final String summary;
  @JsonKey(name: 'latitude')
  final double latitude;
  @JsonKey(name: 'longitude')
  final double longitude;
  @JsonKey(name: 'descript')
  final String? description;
  @JsonKey(name: 'tel')
  final String? tel;
  @JsonKey(name: 'openTime')
  final String? openTime;
  @JsonKey(name: 'dayOff')
  final String? dayOff;

  const Spot({
    required this.id,
    required this.title,
    required this.address,
    required this.images,
    required this.summary,
    required this.latitude,
    required this.longitude,
    this.description,
    this.tel,
    this.openTime,
    this.dayOff,
  });

  factory Spot.fromJson(Map<String, dynamic> json) => _$SpotFromJson(json);

  Map<String, dynamic> toJson() => _$SpotToJson(this);
}
