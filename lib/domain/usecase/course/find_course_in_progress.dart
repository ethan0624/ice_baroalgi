import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';

class FindCourseInProgress {
  final CourseRepository repository;
  const FindCourseInProgress({required this.repository});

  Future<Result<List<Course>, Exception>> call() {
    return repository.findCourseInProgress();
  }
}
