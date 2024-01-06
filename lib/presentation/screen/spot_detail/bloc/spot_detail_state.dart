part of 'spot_detail_bloc.dart';

class SpotDetailState extends BaseState {
  final Spot? spot;
  final List<Course> includeCourse;

  const SpotDetailState({
    super.isLoading,
    this.spot,
    this.includeCourse = const [],
  });

  copyWith({bool? isLoading, Spot? spot, List<Course>? includeCourse}) {
    return SpotDetailState(
      isLoading: isLoading ?? this.isLoading,
      spot: spot ?? this.spot,
      includeCourse: includeCourse ?? this.includeCourse,
    );
  }

  @override
  List<Object?> get props => [isLoading, spot, includeCourse];
}
