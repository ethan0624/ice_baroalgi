import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/push.dart';
import 'package:incheon_knowhow/domain/repository/etc_repository.dart';

class FindPush {
  final AuthProvider authProvider;
  final EtcRepository repository;
  const FindPush({required this.authProvider, required this.repository});

  Future<Result<List<Push>, Exception>> call() async {
    if (!authProvider.isAuthenticated()) {
      return Result.error(Exception('not found user'));
    }
    return repository.findPush();
  }
}
