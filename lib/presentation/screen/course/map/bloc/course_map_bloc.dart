import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:incheon_knowhow/config/app_event.dart';
import 'package:incheon_knowhow/core/extension/extension.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:incheon_knowhow/domain/usecase/course/cancel_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/complete_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/get_course_info.dart';
import 'package:incheon_knowhow/domain/usecase/course/start_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/update_favorite.dart';
import 'package:incheon_knowhow/domain/usecase/spot/set_spot_flag.dart';
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
  final _cancelCourse = getIt<CancelCourse>();
  final _setSpotFlag = getIt<SetSpotFlag>();

  final int courseId;
  Course? _course;
  final List<Spot> _spots = [];

  CourseMapBloc({required this.courseId}) : super(const CourseMapState()) {
    on<CourseMapOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _getCourseInfo(courseId);
      _course = res.tryGetSuccess();

      _spots.clear();
      _spots.addAll(_course?.spots ?? []);

      emit(state.copyWith(
        isLoading: false,
        course: res.tryGetSuccess(),
        spots: _spots,
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

      emit(state.copyWith(isLoading: true));

      final res = await _startCourse(_course!.id);

      final updateCourse =
          res.isSuccess() ? _course?.copyWith(isProgress: true) : _course;

      _course = updateCourse;

      emit(state.copyWith(
        isLoading: false,
        course: updateCourse,
      ));

      if (res.isSuccess()) {
        _eventBus.fire(CourseChangedEvent(updateCourse));
      }

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: res.tryGetError()?.message ?? 'unknow error'));
      }
    });

    on<CourseMapOnComplete>((event, emit) async {
      if (state.isLoading || _course == null) return;

      emit(state.copyWith(isLoading: true));

      final res = await _completeCourse(_course!.id);

      final updateCourse =
          res.isSuccess() ? _course?.copyWith(isCompleted: true) : _course;
      _course = updateCourse;

      emit(state.copyWith(
        isLoading: false,
        course: updateCourse,
      ));

      if (res.isSuccess()) {
        _eventBus.fire(CourseChangedEvent(updateCourse));
      }

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: res.tryGetError()?.message ?? 'unknow error'));
      }
    });

    on<CourseMapOnCancel>((event, emit) async {
      if (state.isLoading || _course == null) return;

      emit(state.copyWith(isLoading: true));

      final res = await _cancelCourse(_course!.id);

      final updateCourse =
          res.isSuccess() ? _course?.copyWith(isProgress: false) : _course;
      _course = updateCourse;

      emit(state.copyWith(
        isLoading: false,
        course: updateCourse,
      ));

      if (res.isSuccess()) {
        _eventBus.fire(CourseChangedEvent(updateCourse));
      }

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: res.tryGetError()?.message ?? 'unknow error'));
      }
    });

    on<CourseMapOnRegistSpotFlag>((event, emit) async {
      if (state.isLoading || _course == null) return;

      emit(state.copyWith(isLoading: true));

      final res = await _setSpotFlag(event.spotId);

      emit(state.copyWith(isLoading: false));

      if (res.isSuccess()) {
        final updateIndex = _spots.indexWhere((e) => e.id == event.spotId);

        final spots = [..._spots];
        if (updateIndex >= 0) {
          final updateSpot = _spots[updateIndex].copyWith(flag: true);
          spots.removeAt(updateIndex);
          spots.insert(updateIndex, updateSpot);
        }

        _spots.clear();
        _spots.addAll(spots);

        emit(state.copyWith(spots: _spots));

        produceSideEffect(const SuccessEffect());
      }

      if (res.isSuccess()) {
        final updateCourse = _course?.copyWith(
          completedSpotCount: _spots.where((e) => e.isFlag).length,
        );
        _eventBus.fire(CourseChangedEvent(updateCourse));
      }

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: res.tryGetError()?.message ?? 'unknow error'));
      }
    });
  }
}
