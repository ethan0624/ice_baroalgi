part of 'course_info_bloc.dart';

sealed class CourseInfoEvent extends Equatable {
  const CourseInfoEvent();

  const factory CourseInfoEvent.initial() = CourseInfoOnInitial;
  const factory CourseInfoEvent.toggleFavorite() = CourseInfoOnFavorite;
  const factory CourseInfoEvent.start() = CourseInfoOnStart;
  const factory CourseInfoEvent.complete() = CourseInfoOnComplete;
  const factory CourseInfoEvent.cancel() = CourseInfoOnCancel;

  @override
  List<Object> get props => [];
}

class CourseInfoOnInitial extends CourseInfoEvent {
  const CourseInfoOnInitial();
}

class CourseInfoOnFavorite extends CourseInfoEvent {
  const CourseInfoOnFavorite();
}

class CourseInfoOnStart extends CourseInfoEvent {
  const CourseInfoOnStart();
}

class CourseInfoOnComplete extends CourseInfoEvent {
  const CourseInfoOnComplete();
}

class CourseInfoOnCancel extends CourseInfoEvent {
  const CourseInfoOnCancel();
}
