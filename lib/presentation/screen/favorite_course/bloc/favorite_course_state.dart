part of 'favorite_course_bloc.dart';

class FavoriteCourseState extends BaseState {
  final List<Course> favoriteCourse;
  const FavoriteCourseState({
    super.isLoading,
    this.favoriteCourse = const [],
  });

  copyWith({
    bool? isLoading,
    List<Course>? favoriteCourse,
  }) {
    return FavoriteCourseState(
      isLoading: isLoading ?? this.isLoading,
      favoriteCourse: favoriteCourse ?? this.favoriteCourse,
    );
  }

  @override
  List<Object> get props => [isLoading, favoriteCourse];
}
