import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';

class FindCourseInProgress {
  final AuthProvider authProvider;
  final CourseRepository repository;
  const FindCourseInProgress(
      {required this.authProvider, required this.repository});

  Future<Result<List<Course>, Exception>> call() async {
    if (!authProvider.isAuthenticated()) {
      return Result.error(Exception('not found user'));
    }

    return repository.findCourseInProgress();
  }
}
