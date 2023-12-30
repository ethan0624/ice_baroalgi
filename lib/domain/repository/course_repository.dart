import 'package:incheon_knowhow/domain/model/topic_course.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/course.dart';

abstract class CourseRepository {
  Future<Result<List<TopicCourse>, Exception>> findTopicWithCourse();

  Future<Result<List<Course>, Exception>> findCourse({
    int? regionCategoryId,
    int? recommendedCategoryId,
  });

  Future<Result<List<Course>, Exception>> findCourseInProgress();

  Future<Result<List<Course>, Exception>> findCourseWish();

  Future<Result<Course, Exception>> getCourseInfo({required int courseId});
}
