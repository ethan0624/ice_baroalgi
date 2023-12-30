part of 'my_course_bloc.dart';

sealed class MyCourseEvent extends Equatable {
  const MyCourseEvent();

  const factory MyCourseEvent.initial() = MyCourseOnInitial;

  @override
  List<Object> get props => [];
}

class MyCourseOnInitial extends MyCourseEvent {
  const MyCourseOnInitial();
}
