import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/repository/search_repository.dart';

class FindRecentKeyword {
  final SearchRepository repository;
  const FindRecentKeyword({required this.repository});

  Future<Result<List<String>, Exception>> call() {
    return repository.findRecentKeyword();
  }
}
