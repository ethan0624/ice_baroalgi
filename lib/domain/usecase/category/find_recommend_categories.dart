import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/repository/category_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class FindRecommendCategoreis {
  final CategoryRepository repository;
  const FindRecommendCategoreis({required this.repository});

  Future<Result<List<Category>, Exception>> call() {
    return repository.findRecommendCategories();
  }
}
