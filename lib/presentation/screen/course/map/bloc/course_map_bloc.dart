import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:incheon_knowhow/config/app_event.dart';
import 'package:incheon_knowhow/core/extension/extension.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:incheon_knowhow/domain/usecase/course/complete_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/get_course_info.dart';
import 'package:incheon_knowhow/domain/usecase/course/start_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/update_favorite.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'course_map_event.dart';
part 'course_map_state.dart';

class CourseMapBloc extends BaseSideEffectBloc<CourseMapEvent, CourseMapState> {
  final _eventBus = getIt<EventBus>();
  final _getCourseInfo = getIt<GetCourseInfo>();
  final _updateFavorite = getIt<UpdateFavorite>();
  final _startCourse = getIt<StartCourse>();
  final _completeCourse = getIt<CompleteCourse>();

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

    on<CourseMapOnSelectedSpot>((event, emit) async {
      if (_course == null) return;
      final spot =
          (_course?.spots ?? []).firstWhere((e) => e.id == event.spotId);
      emit(state.copyWith(selectedSpot: spot));
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

    on<CourseMapOnStart>((event, emit) async {
      if (state.isLoading || _course == null) return;

      final res = await _startCourse(_course!.id);

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: res.tryGetError()?.message ?? 'unknow error'));
      }
    });

    on<CourseMapOnComplete>((event, emit) async {
      if (state.isLoading || _course == null) return;

      final res = await _completeCourse(_course!.id);

      // todo:
    });

    on<CourseMapOnCancel>((event, emit) async {});
  }
}
