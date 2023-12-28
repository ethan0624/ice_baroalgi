import 'package:incheon_knowhow/domain/repository/auth_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class UpdatePassword {
  final AuthRepository repository;
  const UpdatePassword({required this.repository});

  Future<Result<bool, Exception>> call({
    required int userId,
    required String changePassword,
  }) {
    return repository.updatePassword(userId: userId, password: changePassword);
  }
}
