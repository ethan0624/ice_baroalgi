import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:multiple_result/multiple_result.dart';

class GetCourseInfo {
  const GetCourseInfo();

  Future<Result<Course, Exception>> call({required int courseId}) async {
    return Future(() => Result.success(Course.mock()));
  }
}
