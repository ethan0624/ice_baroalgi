import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/topic_course.dart';
import 'package:incheon_knowhow/domain/repository/course_repository.dart';

class FindTopicWithCourse {
  final CourseRepository repository;
  const FindTopicWithCourse({required this.repository});

  Future<Result<List<TopicCourse>, Exception>> call() {
    return repository.findTopicWithCourse();
  }
}
