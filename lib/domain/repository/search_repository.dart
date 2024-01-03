import 'package:incheon_knowhow/domain/model/search_result.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SearchRepository {
  Future<Result<SearchResult, Exception>> search(String keywoard);
}
