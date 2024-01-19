import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/repository/search_repository.dart';

class DeleteRecentKeyword {
  final SearchRepository repository;
  const DeleteRecentKeyword({required this.repository});

  Future<Result<List<String>, Exception>> call(String keyword) {
    return repository.deleteRecentKeyword(keyword);
  }
}
