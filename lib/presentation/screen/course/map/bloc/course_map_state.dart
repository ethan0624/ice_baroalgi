part of 'course_map_bloc.dart';

class CourseMapState extends BaseState {
  final Course? course;
  final List<Spot> spots;
  final Spot? selectedSpot;
  const CourseMapState({
    super.isLoading,
    this.course,
    this.spots = const [],
    this.selectedSpot,
  });

  copyWith({
    bool? isLoading,
    Course? course,
    List<Spot>? spots,
    Spot? selectedSpot,
  }) {
    return CourseMapState(
      isLoading: isLoading ?? this.isLoading,
      course: course ?? this.course,
      spots: spots ?? this.spots,
      selectedSpot: selectedSpot ?? this.selectedSpot,
    );
  }

  @override
  List<Object?> get props => [isLoading, course, spots, selectedSpot];
}
