import 'package:incheon_knowhow/data/request/course_stamp_request.dart';
import 'package:incheon_knowhow/domain/model/my_course.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/topic_course.dart';
import 'package:incheon_knowhow/domain/model/course.dart';

abstract class CourseRepository {
  Future<Result<List<TopicCourse>, Exception>> findTopicWithCourse();

  Future<Result<List<Course>, Exception>> findCourse({
    int? regionCategoryId,
    int? recommendedCategoryId,
  });

  Future<Result<List<Course>, Exception>> findCourseInProgress();

  Future<Result<List<Course>, Exception>> findCourseWish();

  Future<Result<MyCourse, Exception>> myCourse();

  Future<Result<Course, Exception>> getCourseInfo(int id);

  Future<Result<bool, Exception>> updateFavorite(int id);

  Future<Result<bool, Exception>> start(int id);

  Future<Result<bool, Exception>> completed(int id);

  Future<Result<bool, Exception>> cancel(int id);

  Future<Result<bool, Exception>> stamp(
      int id, CourseStampRequest stampRequest);
}
