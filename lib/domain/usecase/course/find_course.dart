import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:multiple_result/multiple_result.dart';

class FindCourse {
  const FindCourse();

  Future<Result<List<Course>, Exception>> call() async {
    return Future(() => Result.success([
          Course.mock(),
          Course.mock(),
        ]));
  }
}
