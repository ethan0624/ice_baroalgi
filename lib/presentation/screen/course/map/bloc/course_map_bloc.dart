import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/usecase/course/get_course_info.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'course_map_event.dart';
part 'course_map_state.dart';

class CourseMapBloc extends BaseSideEffectBloc<CourseMapEvent, CourseMapState> {
  final _getCourseInfo = getIt<GetCourseInfo>();

  final int courseId;
  CourseMapBloc({required this.courseId}) : super(const CourseMapState()) {
    on<CourseMapOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _getCourseInfo(courseId);

      emit(state.copyWith(
        isLoading: false,
        course: res.tryGetSuccess(),
      ));
    });

    on<CourseMapOnStart>((event, emit) async {});

    on<CourseMapOnComplete>((event, emit) async {});

    on<CourseMapOnCancel>((event, emit) async {});
  }
}
