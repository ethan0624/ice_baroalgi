import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:multiple_result/multiple_result.dart';

class GetUserInfo {
  final AuthProvider authProvider;
  const GetUserInfo({
    required this.authProvider,
  });

  Future<Result<User, Exception>> call() async {
    return Future.delayed(
        const Duration(milliseconds: 500), () => Result.success(User.tester()));
  }
}
