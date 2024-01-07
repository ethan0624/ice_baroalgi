part of 'course_map_bloc.dart';

class CourseMapState extends BaseState {
  final Course? course;
  final Spot? selectedSpot;
  const CourseMapState({
    super.isLoading,
    this.course,
    this.selectedSpot,
  });

  copyWith({
    bool? isLoading,
    Course? course,
    Spot? selectedSpot,
  }) {
    return CourseMapState(
      isLoading: isLoading ?? this.isLoading,
      course: course ?? this.course,
      selectedSpot: selectedSpot ?? this.selectedSpot,
    );
  }

  @override
  List<Object?> get props => [isLoading, course, selectedSpot];
}
