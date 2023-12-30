part of 'course_map_bloc.dart';

class CourseMapState extends BaseState {
  final Course? course;
  const CourseMapState({
    super.isLoading,
    this.course,
  });

  copyWith({
    bool? isLoading,
    Course? course,
  }) {
    return CourseMapState(
      isLoading: isLoading ?? this.isLoading,
      course: course ?? this.course,
    );
  }

  @override
  List<Object?> get props => [isLoading, course];
}
