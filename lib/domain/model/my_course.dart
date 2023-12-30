import 'package:json_annotation/json_annotation.dart';
import 'package:incheon_knowhow/domain/model/course.dart';

part 'my_course.g.dart';

@JsonSerializable()
class MyCourse {
  @JsonKey(name: 'readyCourse')
  final List<Course> inProgressCourse;
  @JsonKey(name: 'finishCourse')
  final List<Course> completedCourse;

  const MyCourse({
    required this.inProgressCourse,
    required this.completedCourse,
  });

  factory MyCourse.fromJson(Map<String, dynamic> json) =>
      _$MyCourseFromJson(json);

  Map<String, dynamic> toJson() => _$MyCourseToJson(this);
}
