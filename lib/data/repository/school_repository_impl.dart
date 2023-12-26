// ignore_for_file: implementation_imports
import 'package:incheon_knowhow/config/app_config.dart';
import 'package:multiple_result/src/result.dart';
import 'package:incheon_knowhow/data/datasource/neis_api_client.dart';
import 'package:incheon_knowhow/domain/model/school_paging.dart';
import 'package:incheon_knowhow/domain/repository/school_repository.dart';

class SchoolRepositoryImpl implements SchoolRepository {
  final NeisApiClient apiClient;
  const SchoolRepositoryImpl({required this.apiClient});

  @override
  Future<Result<SchoolPaging, Exception>> findSchool({
    int? page,
    int? size,
    String? keyword,
  }) async {
    try {
      final pageNumber = page ?? 1;
      final pageSize = size ?? 10;

      print('>>> call');

      final res = await apiClient.findSchools(
        AppConfig.openNeisApiKey,
        pageNumber,
        pageSize,
        'json',
        keyword ?? '',
      );
      print('>>> res : $res');
      if (res.infos.isEmpty) {
        return Result.error(Exception('data not found'));
      }

      final info = res.infos.firstOrNull;
      final infoPage = info?.pages.firstOrNull;
      final totalCount = infoPage?.totalCount ?? 0;
      final totalPage = (totalCount / pageSize).round();
      final paging = SchoolPaging(
        totalCount: totalCount,
        totalPage: totalPage,
        page: totalPage,
        rows: info?.rows ?? [],
      );

      return Result.success(paging);
    } catch (e, s) {
      print('>>>>>> api error : $e /// $s');
      return Result.error(Exception(e));
    }
  }
}
