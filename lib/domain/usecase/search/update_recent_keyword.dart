import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/repository/search_repository.dart';

class UpdateRecentKeyword {
  final SearchRepository repository;
  const UpdateRecentKeyword({required this.repository});

  Future<Result<bool, Exception>> call(List<String> keywords) {
    return repository.updateRecentKeyword(keywords);
  }
}
