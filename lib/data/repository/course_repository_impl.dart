// ignore: implementation_imports
import 'package:multiple_result/src/result.dart';
import 'package:incheon_knowhow/data/response/safety_call.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/model/topic_course.dart';
import 'package:incheon_knowhow/domain/model/my_course.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final ApiClient apiClient;
  const CourseRepositoryImpl({required this.apiClient});

  @override
  Future<Result<List<TopicCourse>, Exception>> findTopicWithCourse() async {
    final res =
        await safetyCall<List<TopicCourse>>(apiClient.findTopicCourse());
    final result = res.tryGetSuccess()?.data ?? [];
    return res.isSuccess()
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<List<Course>, Exception>> findCourse({
    int? regionCategoryId,
    int? recommendedCategoryId,
  }) async {
    final data = {
      'regionId': regionCategoryId ?? '',
      'recommendedId': recommendedCategoryId ?? '',
      'categoryId': '',
    };
    final res = await safetyCall<List<Course>>(apiClient.findCourse(data));
    final result = res.tryGetSuccess()?.data ?? [];
    return res.isSuccess()
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<List<Course>, Exception>> findCourseInProgress() async {
    final res =
        await safetyCall<List<Course>>(apiClient.findCourseInProgress());
    final result = res.tryGetSuccess()?.data ?? [];
    return res.isSuccess()
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<List<Course>, Exception>> findCourseWish() async {
    final res = await safetyCall<List<Course>>(apiClient.findCourseWish());
    final result = res.tryGetSuccess()?.data ?? [];
    return res.isSuccess()
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<MyCourse, Exception>> myCourse() async {
    final res = await safetyCall<MyCourse>(apiClient.myCourse());
    final result = res.tryGetSuccess()?.data;
    return res.isSuccess() && result != null
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<Course, Exception>> getCourseInfo(int id) async {
    final res = await safetyCall<Course>(apiClient.getCourseInfo(id));
    final result = res.tryGetSuccess()?.data;
    return res.isSuccess() && result != null
        ? Result.success(result)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> updateFavorite(int id) async {
    final res = await safetyCall<String>(apiClient.updagteFavorite(id));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> start(int id) async {
    final res = await safetyCall<String>(apiClient.startCourse(id));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> completed(int id) async {
    final res = await safetyCall<String>(apiClient.completedCourse(id));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }

  @override
  Future<Result<bool, Exception>> cancel(int id) async {
    final res = await safetyCall<String>(apiClient.cancelCourse(id));
    return res.isSuccess()
        ? const Result.success(true)
        : Result.error(res.tryGetError() ?? Exception('unkonw error'));
  }
}
