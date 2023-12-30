import 'package:incheon_knowhow/data/request/user_register_request.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class RegistUser {
  final AuthRepository repository;
  const RegistUser({required this.repository});

  Future<Result<bool, Exception>> call(UserRegisterRequest request) {
    return repository.register(request: request);
  }
}
