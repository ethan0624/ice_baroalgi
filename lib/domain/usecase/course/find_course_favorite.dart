import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';

class FindCourseFavorite {
  final CourseRepository repository;
  const FindCourseFavorite({required this.repository});

  Future<Result<List<Course>, Exception>> call() {
    return repository.findCourseWish();
  }
}
