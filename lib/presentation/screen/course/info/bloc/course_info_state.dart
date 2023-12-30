part of 'course_info_bloc.dart';

class CourseInfoState extends BaseState {
  final Course? course;
  const CourseInfoState({
    super.isLoading,
    this.course,
  });

  copyWith({
    bool? isLoading,
    Course? course,
  }) {
    return CourseInfoState(
      isLoading: isLoading ?? this.isLoading,
      course: course ?? this.course,
    );
  }

  @override
  List<Object?> get props => [isLoading, course];
}
