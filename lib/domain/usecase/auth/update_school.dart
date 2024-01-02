import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';

class UpdateSchool {
  final AuthProvider authProvider;
  final AuthRepository repository;
  const UpdateSchool({required this.authProvider, required this.repository});

  Future<Result<bool, Exception>> call({
    required String school,
    required int grade,
    required int group,
  }) async {
    if (!authProvider.isAuthenticated()) {
      return Result.error(Exception('not found user'));
    }
    return repository.updateSchool(school: school, grade: grade, group: group);
  }
}
