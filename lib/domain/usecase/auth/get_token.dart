import 'package:incheon_knowhow/domain/model/token.dart';
import 'package:multiple_result/multiple_result.dart';

class GetToken {
  const GetToken();

  Future<Result<Token, Exception>> call({
    required String email,
    required String password,
  }) {
    return Future.delayed(const Duration(milliseconds: 500), () {
      if (email == 'test@test.co.kr') {
        return Result.success(Token.mock());
      } else {
        return Result.error(
            Exception('일치하는 회원이 없습니다\n(테스트는 test@test.co.kr을 입력해주세요)'));
      }
    });
  }
}
