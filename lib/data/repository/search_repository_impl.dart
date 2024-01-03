// ignore: implementation_imports
import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/data/response/safety_call.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/domain/model/search_result.dart';
import 'package:incheon_knowhow/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final ApiClient apiClient;
  const SearchRepositoryImpl({required this.apiClient});
  @override
  Future<Result<SearchResult, Exception>> search(String keywoard) async {
    final data = {
      'searchQuery': keywoard,
    };
    final res = await safetyCall<SearchResult>(apiClient.search(data));
    final result = res.tryGetSuccess()?.data;
    return res.isSuccess() && result != null
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }
}
