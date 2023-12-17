import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:multiple_result/multiple_result.dart';

class GetUserInfo {
  const GetUserInfo();

  Future<Result<User, Exception>> call() {
    return Future(() => Result.success(User.tester()));
  }
}
