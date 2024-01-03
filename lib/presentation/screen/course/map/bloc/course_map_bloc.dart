import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:incheon_knowhow/config/app_event.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/usecase/course/get_course_info.dart';
import 'package:incheon_knowhow/domain/usecase/course/update_favorite.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'course_map_event.dart';
part 'course_map_state.dart';

class CourseMapBloc extends BaseSideEffectBloc<CourseMapEvent, CourseMapState> {
  final _eventBus = getIt<EventBus>();
  final _getCourseInfo = getIt<GetCourseInfo>();
  final _updateFavorite = getIt<UpdateFavorite>();

  final int courseId;
  Course? _course;

  CourseMapBloc({required this.courseId}) : super(const CourseMapState()) {
    on<CourseMapOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _getCourseInfo(courseId);
      _course = res.tryGetSuccess();

      emit(state.copyWith(
        isLoading: false,
        course: res.tryGetSuccess(),
      ));
    });

    on<CourseMapOnFavorite>((event, emit) async {
      final course = _course;

      if (course == null) return;

      final updateCourse = course.copyWith(isLiked: !course.isLiked);
      emit(state.copyWith(course: updateCourse));

      final res = await _updateFavorite(courseId);

      if (res.isSuccess()) {
        _eventBus.fire(CourseChangedEvent(updateCourse));
        _course = updateCourse;
      }
    });

    on<CourseMapOnStart>((event, emit) async {});

    on<CourseMapOnComplete>((event, emit) async {});

    on<CourseMapOnCancel>((event, emit) async {});
  }
}
