import 'package:incheon_knowhow/domain/model/find_id_result.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class FindUserId {
  final AuthRepository repository;
  const FindUserId({required this.repository});

  Future<Result<FindIdResult, Exception>> call({
    required String name,
    required String birth,
    required String phone,
  }) {
    return repository.findUserId(name: name, birth: birth, phone: phone);
  }
}
