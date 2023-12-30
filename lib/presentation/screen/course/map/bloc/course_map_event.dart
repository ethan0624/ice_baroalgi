part of 'course_map_bloc.dart';

sealed class CourseMapEvent extends Equatable {
  const CourseMapEvent();

  const factory CourseMapEvent.initial() = CourseMapOnInitial;

  @override
  List<Object> get props => [];
}

class CourseMapOnInitial extends CourseMapEvent {
  const CourseMapOnInitial();
}
