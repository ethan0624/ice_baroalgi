import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';

class Withdraw {
  final AuthProvider authProvider;
  final AuthRepository repository;
  const Withdraw({
    required this.authProvider,
    required this.repository,
  });

  Future<Result<bool, Exception>> call() async {
    final res = await repository.withdraw();
    if (res.isSuccess()) {
      await authProvider.logout();
    }
    return res;
  }
}
