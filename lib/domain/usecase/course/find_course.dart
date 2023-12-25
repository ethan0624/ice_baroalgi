import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class FindCourse {
  final CourseRepository repository;
  const FindCourse({required this.repository});

  Future<Result<List<Course>, Exception>> call({
    int? regionCategoryId,
    int? recommendedCategoryId,
  }) {
    return repository.findCourse(
      regionCategoryId: regionCategoryId,
      recommendedCategoryId: recommendedCategoryId,
    );
  }
}
