import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class GetCourseInfo {
  final CourseRepository repository;
  const GetCourseInfo({required this.repository});

  Future<Result<Course, Exception>> call(int id) async {
    return repository.getCourseInfo(id);
  }
}
