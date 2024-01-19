// ignore: implementation_imports
import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/data/response/safety_call.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/domain/model/search_result.dart';
import 'package:incheon_knowhow/domain/repository/search_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchRepositoryImpl implements SearchRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  final String _recentKeywordStorageKey = "pref_recent_keyword";
  const SearchRepositoryImpl({
    required this.apiClient,
    required this.sharedPreferences,
  });

  @override
  Future<Result<List<String>, Exception>> findRecentKeyword() async {
    return Result.success(
        sharedPreferences.getStringList(_recentKeywordStorageKey) ?? []);
  }

  @override
  Future<Result<bool, Exception>> updateRecentKeyword(
      List<String> keywords) async {
    final result = await sharedPreferences.setStringList(
        _recentKeywordStorageKey, keywords);
    return Result.success(result);
  }

  @override
  Future<Result<List<String>, Exception>> deleteRecentKeyword(
      String keyword) async {
    final keywords =
        sharedPreferences.getStringList(_recentKeywordStorageKey) ?? [];
    if (keywords.contains(keyword)) {
      keywords.remove(keyword);
      await sharedPreferences.setStringList(_recentKeywordStorageKey, keywords);
    }

    return Result.success(keywords);
  }

  @override
  Future<Result<bool, Exception>> clearRecentKeyword() async {
    final result =
        await sharedPreferences.setStringList(_recentKeywordStorageKey, []);
    return Result.success(result);
  }

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
