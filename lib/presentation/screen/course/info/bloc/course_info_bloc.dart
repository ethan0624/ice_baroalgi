import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/usecase/course/get_course_info.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'course_info_event.dart';
part 'course_info_state.dart';

class CourseInfoBloc
    extends BaseSideEffectBloc<CourseInfoEvent, CourseInfoState> {
  final _getCourseInfo = getIt<GetCourseInfo>();
  final int courseId;
  CourseInfoBloc({required this.courseId}) : super(const CourseInfoState()) {
    on<CourseInfoOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _getCourseInfo(courseId);

      emit(state.copyWith(
        isLoading: false,
        course: res.tryGetSuccess(),
      ));
    });
  }
}
