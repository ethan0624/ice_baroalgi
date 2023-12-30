import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_my_course.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'my_course_event.dart';
part 'my_course_state.dart';

class MyCourseBloc extends BaseSideEffectBloc<MyCourseEvent, MyCourseState> {
  final _findMyCourse = getIt<FindMyCourse>();
  MyCourseBloc() : super(const MyCourseState()) {
    on<MyCourseOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await _findMyCourse();
      final myCourse = res.tryGetSuccess();

      emit(state.copyWith(
        isLoading: false,
        inProgressCourse: myCourse?.inProgressCourse,
        completedCourse: myCourse?.completedCourse,
      ));
    });
  }
}
