import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topic_course.g.dart';

@JsonSerializable()
class TopicCourse {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'coursedata')
  final List<Course>? courses;

  const TopicCourse({
    required this.id,
    required this.title,
    this.courses,
  });

  factory TopicCourse.fromJson(Map<String, dynamic> json) =>
      _$TopicCourseFromJson(json);

  Map<String, dynamic> toJson() => _$TopicCourseToJson(this);
}

extension TopicCourseExtension on TopicCourse {
  bool get hasCourse => courses?.isNotEmpty == true;
}
