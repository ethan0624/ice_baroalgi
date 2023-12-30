import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_course_favorite.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'favorite_course_event.dart';
part 'favorite_course_state.dart';

class FavoriteCourseBloc
    extends BaseSideEffectBloc<FavoriteCourseEvent, FavoriteCourseState> {
  final _findCourseFavorite = getIt<FindCourseFavorite>();
  FavoriteCourseBloc() : super(const FavoriteCourseState()) {
    on<FavoriteCourseOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await _findCourseFavorite();

      emit(state.copyWith(
        isLoading: false,
        favoriteCourse: res.tryGetSuccess(),
      ));
    });
  }
}
