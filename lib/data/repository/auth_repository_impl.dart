// ignore: implementation_imports
import 'package:multiple_result/src/result.dart';
import 'package:incheon_knowhow/data/response/safety_call.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/data/request/user_register_request.dart';
import 'package:incheon_knowhow/data/response/data_response.dart';
import 'package:incheon_knowhow/domain/model/token.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:incheon_knowhow/domain/model/find_id_result.dart';
import 'package:incheon_knowhow/domain/model/certification_code.dart';
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
    final res = await safetyCall<Token>(apiClient.login(data));
    final token = res.tryGetSuccess()?.data;
    return res.isSuccess() && token != null
        ? Result.success(token)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<FindIdResult, Exception>> findUserId({
    required String name,
    required String birth,
    required String phone,
  }) async {
    final data = {
      'name': name,
      'birth': birth,
      'phone': phone.replaceAll('-', ''),
    };
    final res = await safetyCall<FindIdResult>(apiClient.findUserId(data));
    final result = res.tryGetSuccess()?.data;
    return res.isSuccess() && result != null
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<User, Exception>> getUserMe() async {
    final res = await safetyCall<User>(apiClient.getUserMe());
    final result = res.tryGetSuccess()?.data;
    return res.isSuccess() && result != null
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<CertificationCode, Exception>> sendCertificationCode({
    required String name,
    required String email,
  }) async {
    final data = {
      'name': name,
      'email': email,
    };
    final res = await safetyCall(apiClient.sendEmailCertificationCode(data));
    final result =
        res.tryGetSuccess()?.data?.copyWith(email: email, name: name);
    return res.isSuccess() && result != null
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> updatePassword({
    required int userId,
    required String password,
  }) async {
    final data = {
      'password': password,
      'userId': userId,
    };
    final res = await safetyCall(apiClient.updateUserPassword(data));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> duplicateEmail({
    required String email,
  }) async {
    final data = {
      'email': email,
    };
    final res = await safetyCall(apiClient.duplicateEmail(data));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> checkPassword({
    required String password,
  }) async {
    final data = {
      'password': password,
    };
    final res = await safetyCall(apiClient.checkPassword(data));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> register({
    required UserRegisterRequest request,
  }) async {
    final res = await safetyCall(apiClient.register(request.toJson()));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> updateSchool({
    required String school,
    required int grade,
    required int group,
  }) async {
    final data = {
      'school': school,
      'grade': grade,
      'class': group,
    };
    final res = await safetyCall(apiClient.updateUserSchool(data));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> updateJinro({required String email}) async {
    final data = {'email': email};
    final res = await safetyCall(apiClient.updateJinroAccount(data));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> updatePhone({
    required String phoneNumber,
  }) async {
    final data = {
      'phone': phoneNumber,
    };
    final res = await safetyCall(apiClient.updateUserPassword(data));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> withdraw() async {
    final res = await safetyCall(apiClient.withdraw());
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }
}
