// ignore: implementation_imports
import 'package:multiple_result/src/result.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  const CategoryRepositoryImpl();

  @override
  Future<Result<List<Category>, Exception>> findTopicCategories() {
    // TODO: implement findTopicCategories
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Category>, Exception>> findRegionCategories() {
    // TODO: implement findRegionCategories
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Category>, Exception>> findRecommendCategories() {
    // TODO: implement findRecommandCategories
    throw UnimplementedError();
  }
}
