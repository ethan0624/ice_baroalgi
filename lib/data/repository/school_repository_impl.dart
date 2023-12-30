// ignore_for_file: implementation_imports
import 'dart:convert';
import 'package:incheon_knowhow/config/app_config.dart';
import 'package:incheon_knowhow/domain/model/school.dart';
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

      final res = await apiClient.findSchools(
        AppConfig.openNeisApiKey,
        pageNumber,
        pageSize,
        'json',
        keyword ?? '',
      );

      final json = jsonDecode(res);
      final info = json['schoolInfo'] as List<dynamic>?;
      if (info == null) {
        return Result.error(Exception('not found'));
      }

      final head = info.firstOrNull?['head'];
      final totalCount = head[0]?['list_total_count'] as int? ?? 0;
      final data = info[1]?['row'] ?? [];
      List<School> rows = [];
      for (Map<String, dynamic> row in data) {
        final school = School.fromJson(row);
        rows.add(school);
      }
      final totalPage = (totalCount / pageSize).round();

      return Result.success(SchoolPaging(
        totalCount: totalCount,
        totalPage: totalPage,
        page: pageNumber,
        rows: rows,
      ));
    } catch (e) {
      return Result.error(Exception(e));
    }
  }
}
