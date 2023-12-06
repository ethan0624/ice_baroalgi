import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'favorite_course_event.dart';
part 'favorite_course_state.dart';

class FavoriteCourseBloc
    extends BaseSideEffectBloc<FavoriteCourseEvent, FavoriteCourseState> {
  FavoriteCourseBloc() : super(const FavoriteCourseState()) {
    on<FavoriteCourseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
