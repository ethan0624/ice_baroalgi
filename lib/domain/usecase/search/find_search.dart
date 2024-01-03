import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/search_result.dart';
import 'package:incheon_knowhow/domain/repository/search_repository.dart';

class FindSearch {
  final SearchRepository repository;
  const FindSearch({required this.repository});

  Future<Result<SearchResult, Exception>> call(String keyword) {
    return repository.search(keyword);
  }
}
