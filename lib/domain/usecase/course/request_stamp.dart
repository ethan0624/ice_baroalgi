import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';
import 'package:incheon_knowhow/data/request/course_stamp_request.dart';

class RequestStamp {
  final AuthProvider authProvider;
  final CourseRepository repository;

  const RequestStamp({required this.authProvider, required this.repository});

  Future<Result<bool, Exception>> call({
    required int courseId,
    required CourseStampRequest request,
  }) async {
    if (!authProvider.isAuthenticated()) {
      return Result.error(Exception('not found user'));
    }
    return repository.stamp(courseId, request);
  }
}
