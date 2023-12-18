import 'package:incheon_knowhow/data/request/user_register_request.dart';
import 'package:incheon_knowhow/data/response/data_response.dart';
import 'package:incheon_knowhow/domain/model/token.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AuthRepository {
  Future<Result<Token, Exception>> getToken({
    required String email,
    required String password,
  });

  Future<Result<User, Exception>> getUserMe();

  Future<Result<DataResponse<User>, Exception>> getUserInfo({
    required int userId,
  });

  Future<Result<DataResponse<bool>, Exception>> register({
    required UserRegisterRequest request,
  });

  Future<Result<DataResponse<bool>, Exception>> updatePassword({
    required int userId,
    required String password,
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
