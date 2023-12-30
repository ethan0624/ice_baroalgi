import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/my_course.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';

class FindMyCourse {
  final CourseRepository repository;
  const FindMyCourse({required this.repository});

  Future<Result<MyCourse, Exception>> call() {
    return repository.myCourse();
  }
}
