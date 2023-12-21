// ignore: implementation_imports
import 'package:multiple_result/src/result.dart';
import 'package:incheon_knowhow/data/response/safety_call.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/data/request/user_register_request.dart';
import 'package:incheon_knowhow/data/response/data_response.dart';
import 'package:incheon_knowhow/domain/model/token.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:incheon_knowhow/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient apiClient;
  const AuthRepositoryImpl({required this.apiClient});

  @override
  Future<Result<Token, Exception>> getToken({
    required String email,
    required String password,
  }) async {
    final data = {
      'email': email,
      'password': password,
    };
    final res = await safetyCall(apiClient.login(data));
    final token = res.tryGetSuccess()?.data;
    return res.isSuccess() && token != null
        ? Result.success(token)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<User, Exception>> getUserMe() async {
    return Result.success(User.tester());
  }

  @override
  Future<Result<DataResponse<User>, Exception>> getUserInfo(
      {required int userId}) {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future<Result<DataResponse<bool>, Exception>> register(
      {required UserRegisterRequest request}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Result<DataResponse<bool>, Exception>> updatePassword(
      {required int userId, required String password}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<Result<DataResponse<bool>, Exception>> updatePhone(
      {required int userId, required String phoneNumber}) {
    // TODO: implement updatePhone
    throw UnimplementedError();
  }

  @override
  Future<Result<DataResponse<bool>, Exception>> updateSchool(
      {required int userId,
      required String school,
      required int grade,
      required int group}) {
    // TODO: implement updateSchool
    throw UnimplementedError();
  }

  @override
  Future<Result<DataResponse<bool>, Exception>> withdraw(
      {required int userId}) {
    // TODO: implement withdraw
    throw UnimplementedError();
  }
}
