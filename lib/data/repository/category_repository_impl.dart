// ignore: implementation_imports
import 'package:multiple_result/src/result.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final ApiClient apiClient;
  const CategoryRepositoryImpl({required this.apiClient});

  @override
  Future<Result<List<Category>, Exception>> findTopicCategories() async {
    return Result.success(Category.mockTopics());
  }

  @override
  Future<Result<List<Category>, Exception>> findRegionCategories() async {
    return Result.success(Category.mockRegions());
  }

  @override
  Future<Result<List<Category>, Exception>> findRecommendCategories() async {
    return Result.success(Category.mockRecommends());
  }
}
