import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class CategoryRepository {
  Future<Result<List<Category>, Exception>> findTopicCategories();

  Future<Result<List<Category>, Exception>> findRegionCategories();

  Future<Result<List<Category>, Exception>> findRecommendCategories();
}
