import 'package:incheon_knowhow/domain/model/certification_code.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class SendCertificationCode {
  final AuthRepository repository;
  const SendCertificationCode({required this.repository});

  Future<Result<CertificationCode, Exception>> call({
    required String name,
    required String email,
  }) {
    return repository.sendCertificationCode(name: name, email: email);
  }
}
