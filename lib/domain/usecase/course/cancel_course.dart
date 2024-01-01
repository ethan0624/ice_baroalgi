import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';

class CancelCourse {
  final AuthProvider authProvider;
  final CourseRepository repository;
  const CancelCourse({required this.authProvider, required this.repository});

  Future<Result<bool, Exception>> call(int id) async {
    if (!authProvider.isAuthenticated()) {
      return Result.error(Exception('not found user'));
    }
    return repository.cancel(id);
  }
}
