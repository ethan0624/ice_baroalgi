import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/repository/category_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class FindTopicCategoreis {
  final CategoryRepository repository;
  const FindTopicCategoreis({required this.repository});

  Future<Result<List<Category>, Exception>> call() {
    return repository.findTopicCategories();
  }
}
