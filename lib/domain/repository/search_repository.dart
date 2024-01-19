import 'package:incheon_knowhow/domain/model/search_result.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SearchRepository {
  Future<Result<List<String>, Exception>> findRecentKeyword();

  Future<Result<bool, Exception>> updateRecentKeyword(List<String> keywords);

  Future<Result<List<String>, Exception>> deleteRecentKeyword(String keyword);

  Future<Result<bool, Exception>> clearRecentKeyword();

  Future<Result<SearchResult, Exception>> search(String keywoard);
}
