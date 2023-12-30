import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/repository/etc_repository.dart';

class UpdatePushRead {
  final AuthProvider authProvider;
  final EtcRepository repository;
  const UpdatePushRead({required this.authProvider, required this.repository});

  Future<Result<bool, Exception>> call(int pushId) async {
    if (!authProvider.isAuthenticated()) {
      return Result.error(Exception('not found user'));
    }
    return repository.updatePush(pushId);
  }
}
