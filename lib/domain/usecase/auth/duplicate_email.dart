import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';

class DuplicateEmail {
  final AuthRepository repository;
  const DuplicateEmail({required this.repository});

  Future<Result<bool, Exception>> call({
    required String email,
  }) {
    return repository.duplicateEmail(email: email);
  }
}
