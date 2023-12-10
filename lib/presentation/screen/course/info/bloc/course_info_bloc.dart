import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'course_info_event.dart';
part 'course_info_state.dart';

class CourseInfoBloc
    extends BaseSideEffectBloc<CourseInfoEvent, CourseInfoState> {
  CourseInfoBloc() : super(const CourseInfoState()) {
    on<CourseInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
