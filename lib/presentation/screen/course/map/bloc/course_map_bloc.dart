import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'course_map_event.dart';
part 'course_map_state.dart';

class CourseMapBloc extends BaseSideEffectBloc<CourseMapEvent, CourseMapState> {
  CourseMapBloc() : super(const CourseMapState()) {
    on<CourseMapEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
