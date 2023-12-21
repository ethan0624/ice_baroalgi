// ignore: implementation_imports
import 'package:multiple_result/src/result.dart';
import 'package:incheon_knowhow/data/datasource/api_client.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final ApiClient apiClient;
  const CourseRepositoryImpl({required this.apiClient});

  @override
  Future<Result<List<Course>, Exception>> findCourse() {
    // TODO: implement findCourse
    throw UnimplementedError();
  }

  @override
  Future<Result<Course, Exception>> getCourseInfo({required int courseId}) {
    // TODO: implement getCourseInfo
    throw UnimplementedError();
  }
}
