import 'package:json_annotation/json_annotation.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  @JsonKey(name: 'courseData')
  final List<Course> courses;
  @JsonKey(name: 'spotData')
  final List<Spot> spots;

  const SearchResult({
    required this.courses,
    required this.spots,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
