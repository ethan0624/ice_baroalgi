import 'package:incheon_knowhow/data/request/user_register_request.dart';
import 'package:incheon_knowhow/data/response/data_response.dart';
import 'package:incheon_knowhow/domain/model/certification_code.dart';
import 'package:incheon_knowhow/domain/model/find_id_result.dart';
import 'package:incheon_knowhow/domain/model/token.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AuthRepository {
  Future<Result<Token, Exception>> getToken({
    required String email,
    required String password,
  });

  Future<Result<FindIdResult, Exception>> findUserId({
    required String name,
    required String birth,
    required String phone,
  });

  Future<Result<User, Exception>> getUserMe();

  Future<Result<CertificationCode, Exception>> sendCertificationCode({
    required String name,
    required String email,
  });

  Future<Result<bool, Exception>> updatePassword({
    required int userId,
    required String password,
  });

  Future<Result<bool, Exception>> duplicateEmail({
    required String email,
  });

  Future<Result<bool, Exception>> checkPassword({
    required String password,
  });

  Future<Result<bool, Exception>> register({
    required UserRegisterRequest request,
  });

  Future<Result<bool, Exception>> updateSchool({
    required String school,
    required int grade,
    required int group,
  });

  Future<Result<bool, Exception>> updateJinro({required String email});

  Future<Result<bool, Exception>> updatePhone({
    required String phoneNumber,
  });

  Future<Result<bool, Exception>> withdraw();
}
