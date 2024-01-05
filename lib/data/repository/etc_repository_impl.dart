// ignore: implementation_imports
import 'package:multiple_result/src/result.dart';
import 'package:incheon_knowhow/data/response/safety_call.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/domain/model/push.dart';
import 'package:incheon_knowhow/domain/model/business_info.dart';
import 'package:incheon_knowhow/domain/model/notice_paging.dart';
import 'package:incheon_knowhow/domain/model/faq_paging.dart';
import 'package:incheon_knowhow/domain/repository/etc_repository.dart';

class EtcRepositoryImpl implements EtcRepository {
  final ApiClient apiClient;
  const EtcRepositoryImpl({required this.apiClient});

  @override
  Future<Result<NoticePaging, Exception>> findNotice() async {
    final res = await safetyCall<NoticePaging>(apiClient.findNotice());
    final result = res.tryGetSuccess()?.data;
    return res.isSuccess() && result != null
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<FaqPaging, Exception>> findFaq() async {
    final res = await safetyCall<FaqPaging>(apiClient.findFaq());
    final result = res.tryGetSuccess()?.data;
    return res.isSuccess() && result != null
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<BusinessInfo, Exception>> getBusinessInfo() async {
    final res = await safetyCall<BusinessInfo>(apiClient.getBusinessInfo());
    final result = res.tryGetSuccess()?.data;
    return res.isSuccess() && result != null
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<List<Push>, Exception>> findPush() async {
    final res = await safetyCall<List<Push>>(apiClient.findPush());
    final result = res.tryGetSuccess()?.data ?? [];
    return res.isSuccess()
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> updatePush(int pushId) async {
    final res = await safetyCall<String>(apiClient.updatePush(pushId));

    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }
}
