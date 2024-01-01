import 'package:incheon_knowhow/domain/model/course.dart';

class CourseChangedEvent {
  final Course course;
  const CourseChangedEvent(this.course);
}
