import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class Login {
  final AuthProvider authProvider;
  final AuthRepository repository;
  const Login({
    required this.authProvider,
    required this.repository,
  });

  Future<Result<User, Exception>> call({
    required String email,
    required String password,
  }) async {
    final tokenRes =
        await repository.getToken(email: email, password: password);
    final token = tokenRes.tryGetSuccess();
    if (tokenRes.isError() || token == null) {
      return Result.error(
          tokenRes.tryGetError() ?? Exception('not found token'));
    }

    await authProvider.updateToken(token: token);

    final userRes = await repository.getUserMe();
    final user = userRes.tryGetSuccess();
    if (userRes.isError() || user == null) {
      return Result.error(userRes.tryGetError() ?? Exception('not found user'));
    }

    authProvider.updateUser(user: user);

    return Result.success(user);
  }
}
