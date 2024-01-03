part of 'course_map_bloc.dart';

sealed class CourseMapEvent extends Equatable {
  const CourseMapEvent();

  const factory CourseMapEvent.initial() = CourseMapOnInitial;
  const factory CourseMapEvent.toggleFavorite() = CourseMapOnFavorite;
  const factory CourseMapEvent.start() = CourseMapOnStart;
  const factory CourseMapEvent.complete() = CourseMapOnComplete;
  const factory CourseMapEvent.cancel() = CourseMapOnCancel;

  @override
  List<Object> get props => [];
}

class CourseMapOnInitial extends CourseMapEvent {
  const CourseMapOnInitial();
}

class CourseMapOnFavorite extends CourseMapEvent {
  const CourseMapOnFavorite();
}

class CourseMapOnStart extends CourseMapEvent {
  const CourseMapOnStart();
}

class CourseMapOnComplete extends CourseMapEvent {
  const CourseMapOnComplete();
}

class CourseMapOnCancel extends CourseMapEvent {
  const CourseMapOnCancel();
}
