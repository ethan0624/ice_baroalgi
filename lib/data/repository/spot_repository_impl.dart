// ignore: implementation_imports
import 'package:multiple_result/src/result.dart';
import 'package:incheon_knowhow/data/response/safety_call.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:incheon_knowhow/domain/repository/spot_repository.dart';

class SpotRepositoryImpl implements SpotRepository {
  final ApiClient apiClient;
  const SpotRepositoryImpl({required this.apiClient});
  @override
  Future<Result<Spot, Exception>> getSpotInfo(int id) async {
    final res = await safetyCall<Spot>(apiClient.getSpotInfo(id));
    final result = res.tryGetSuccess()?.data;
    return res.isSuccess() && result != null
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }
}
