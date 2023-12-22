import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/enum/region_category_type.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/usecase/category/find_recommend_categories.dart';
import 'package:incheon_knowhow/domain/usecase/category/find_topic_categories.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends BaseSideEffectBloc<HomeEvent, HomeState> {
  final _findTopicCategories = getIt<FindTopicCategoreis>();
  final _findRecommnedCategories = getIt<FindRecommendCategoreis>();
  // todo : 정복중인 코스 조회
  HomeBloc() : super(const HomeState()) {
    on<HomeOnInitial>((event, emit) async {
      final futures = await Future.wait([
        _findTopicCategories(),
        _findRecommnedCategories(),
      ]);

      final topics = futures[0].tryGetSuccess() ?? [];
      final recommandCategories = futures[1].tryGetSuccess() ?? [];

      emit(state.copyWith(
        topicCategories: topics,
        recommendCategories: recommandCategories,
        filterRegionCourse: Course.mocks(),
        selectedRecommendCategory: recommandCategories.first,
      ));
    });

    on<HomeOnExpanededTopic>((event, emit) async {
      emit(state.expaned(
          expandedTopicCategory:
              event.isExpanded ? event.topicCategory : null));

      // todo : fetch topic by course
    });

    on<HomeOnChangedRegon>((event, emit) async {
      emit(
          state.copyWith(selectedRegionCategoryType: event.regionCategoryType));
      // todo : fetch region by course
    });

    on<HomeOnChangedRecommend>((event, emit) async {
      emit(state.copyWith(selectedRecommendCategory: event.category));

      // todo : fetch recommand by course
    });
  }
}
