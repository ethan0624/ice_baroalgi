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

  Future<Result<DataResponse<User>, Exception>> getUserInfo({
    required int userId,
  });

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

  Future<Result<DataResponse<bool>, Exception>> register({
    required UserRegisterRequest request,
  });

  Future<Result<DataResponse<bool>, Exception>> updatePhone({
    required int userId,
    required String phoneNumber,
  });

  Future<Result<DataResponse<bool>, Exception>> updateSchool({
    required int userId,
    required String school,
    required int grade,
    required int group,
  });

  Future<Result<DataResponse<bool>, Exception>> withdraw({
    required int userId,
  });
}
