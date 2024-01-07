import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/repository/spot_repository.dart';

class SetSpotFlag {
  final AuthProvider authProvider;
  final SpotRepository repository;
  const SetSpotFlag({required this.authProvider, required this.repository});

  Future<Result<bool, Exception>> call(int id) async {
    if (!authProvider.isAuthenticated()) {
      return Result.error(Exception('not found user'));
    }

    return repository.setSpotFlag(id);
  }
}
