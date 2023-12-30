part of 'favorite_course_bloc.dart';

sealed class FavoriteCourseEvent extends Equatable {
  const FavoriteCourseEvent();

  const factory FavoriteCourseEvent.initial() = FavoriteCourseOnInitial;

  @override
  List<Object> get props => [];
}

class FavoriteCourseOnInitial extends FavoriteCourseEvent {
  const FavoriteCourseOnInitial();
}
