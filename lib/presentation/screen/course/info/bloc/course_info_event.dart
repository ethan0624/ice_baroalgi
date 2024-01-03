part of 'course_info_bloc.dart';

sealed class CourseInfoEvent extends Equatable {
  const CourseInfoEvent();

  const factory CourseInfoEvent.initial() = CourseInfoOnInitial;
  const factory CourseInfoEvent.toggleFavorite() = CourseInfoOnFavorite;

  @override
  List<Object> get props => [];
}

class CourseInfoOnInitial extends CourseInfoEvent {
  const CourseInfoOnInitial();
}

class CourseInfoOnFavorite extends CourseInfoEvent {
  const CourseInfoOnFavorite();
}
