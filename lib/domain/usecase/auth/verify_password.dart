import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';

class VerifyPassword {
  final AuthRepository repository;
  const VerifyPassword({required this.repository});

  Future<Result<bool, Exception>> call({
    required String password,
  }) {
    return repository.checkPassword(password: password);
  }
}
