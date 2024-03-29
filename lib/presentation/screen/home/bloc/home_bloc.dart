import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:incheon_knowhow/config/app_event.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/enum/region_category_type.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/model/topic_course.dart';
import 'package:incheon_knowhow/domain/usecase/category/find_recommend_categories.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_course.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_course_in_progress.dart';
import 'package:incheon_knowhow/domain/usecase/course/find_topic_with_course.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseSideEffectBloc<HomeEvent, HomeState> {
  final _eventBus = getIt<EventBus>();
  final _authProvider = getIt<AuthProvider>();
  final _findTopicWithCourse = getIt<FindTopicWithCourse>();
  final _findCourse = getIt<FindCourse>();
  final _findRecommnedCategories = getIt<FindRecommendCategoreis>();
  final _findCourseInProgress = getIt<FindCourseInProgress>();

  final List<Course> _allCourses = [];
  StreamSubscription? _courseChangedSubscription;

  HomeBloc() : super(const HomeState()) {
    on<HomeOnInitial>((event, emit) async {
      _courseChangedSubscription =
          _eventBus.on<CourseChangedEvent>().listen((event) {
        add(const HomeEvent.refresh());
      });

      _authProvider.addListener(_onRefresh);

      emit(state.copyWith(isLoading: true));

      add(const HomeEvent.refresh());
    });

    on<HomeOnRefresh>((event, emit) async {
      final futures = await Future.wait([
        _findTopicWithCourse(),
        _findCourse(),
        _findRecommnedCategories(),
        _findCourseInProgress(),
      ]);

      final topicCourse =
          futures[0].tryGetSuccess() as List<TopicCourse>? ?? [];
      final courses = futures[1].tryGetSuccess() as List<Course>? ?? [];
      final recommandCategories =
          futures[2].tryGetSuccess() as List<Category>? ?? [];
      final inProgressCourse =
          futures[3].tryGetSuccess() as List<Course>? ?? [];

      final firstRecommandCategory = recommandCategories.firstOrNull;

      _allCourses.clear();
      _allCourses.addAll(courses);

      final filterRecommendCourse = _allCourses
          .where((e) => e.recommendCategoryId == firstRecommandCategory?.id)
          .toList();

      emit(state.copyWith(
        isLoading: false,
        topicCourse: topicCourse,
        recommendCategories: recommandCategories,
        filterRegionCourse: _allCourses,
        filterRecommendCourse: filterRecommendCourse,
        inProgressCourse: inProgressCourse,
        selectedRecommendCategory: firstRecommandCategory,
      ));
    });

    on<HomeOnExpanededTopic>((event, emit) async {
      emit(state.expaned(
          expandedTopicId: event.isExpanded ? event.topicId : null));
    });

    on<HomeOnChangedRegon>((event, emit) async {
      emit(
          state.copyWith(selectedRegionCategoryType: event.regionCategoryType));
      final region = event.regionCategoryType;
      List<Course> regionCourse = [];
      if (region == RegionCategoryType.all) {
        regionCourse.addAll(_allCourses);
      } else {
        final filters =
            _allCourses.where((e) => e.regionId == region.value).toList();
        regionCourse.addAll(filters);
      }

      emit(state.copyWith(
        filterRegionCourse: regionCourse,
      ));
    });

    on<HomeOnChangedRecommend>((event, emit) async {
      final filterRecommendCourse = _allCourses
          .where((e) => e.recommendCategoryId == event.category.id)
          .toList();

      emit(state.copyWith(
        selectedRecommendCategory: event.category,
        filterRecommendCourse: filterRecommendCourse,
      ));
    });
  }

  _onRefresh() {
    add(const HomeEvent.refresh());
  }

  @override
  Future<void> close() {
    _courseChangedSubscription?.cancel();
    _authProvider.removeListener(_onRefresh);
    return super.close();
  }
}
