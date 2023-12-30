part of 'my_course_bloc.dart';

class MyCourseState extends BaseState {
  final List<Course> inProgressCourse;
  final List<Course> completedCourse;
  const MyCourseState({
    super.isLoading,
    this.inProgressCourse = const [],
    this.completedCourse = const [],
  });

  copyWith({
    bool? isLoading,
    List<Course>? inProgressCourse,
    List<Course>? completedCourse,
  }) {
    return MyCourseState(
      isLoading: isLoading ?? this.isLoading,
      inProgressCourse: inProgressCourse ?? this.inProgressCourse,
      completedCourse: completedCourse ?? this.completedCourse,
    );
  }

  @override
  List<Object> get props => [isLoading, inProgressCourse, completedCourse];
}
