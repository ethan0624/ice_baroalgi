import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';

class UpdatePhone {
  final AuthProvider authProvider;
  final AuthRepository repository;
  const UpdatePhone({required this.authProvider, required this.repository});

  Future<Result<bool, Exception>> call({required String phoneNumber}) async {
    if (!authProvider.isAuthenticated()) {
      return Result.error(Exception('not found user'));
    }

    return repository.updatePhone(phoneNumber: phoneNumber);
  }
}
