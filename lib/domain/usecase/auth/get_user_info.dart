import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class GetUserInfo {
  final AuthProvider authProvider;
  final AuthRepository repository;
  const GetUserInfo({
    required this.authProvider,
    required this.repository,
  });

  Future<Result<User, Exception>> call() async {
    return repository.getUserMe();
  }
}
