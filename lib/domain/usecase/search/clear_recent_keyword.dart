import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/repository/search_repository.dart';

class ClearRecentKeyword {
  final SearchRepository repository;
  const ClearRecentKeyword({required this.repository});

  Future<Result<bool, Exception>> call() {
    return repository.clearRecentKeyword();
  }
}
