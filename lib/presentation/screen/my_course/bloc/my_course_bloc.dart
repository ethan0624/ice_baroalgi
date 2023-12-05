import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'my_course_event.dart';
part 'my_course_state.dart';

class MyCourseBloc extends BaseSideEffectBloc<MyCourseEvent, MyCourseState> {
  MyCourseBloc() : super(const MyCourseState()) {
    on<MyCourseEvent>((event, emit) {});
  }
}
