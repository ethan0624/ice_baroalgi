part of 'home_bloc.dart';

class HomeState extends BaseState {
  final List<TopicCourse> topicCourse;
  final List<Category> recommendCategories;
  final List<Course> filterRegionCourse;
  final List<Course> filterRecommendCourse;
  final List<Course> inProgressCourse;
  final int? expandedTopicId;
  final RegionCategoryType selectedRegionCategoryType;
  final Category? selectedRecommendCategory;

  const HomeState({
    super.isLoading,
    this.topicCourse = const [],
    this.recommendCategories = const [],
    this.filterRegionCourse = const [],
    this.filterRecommendCourse = const [],
    this.inProgressCourse = const [],
    this.expandedTopicId,
    this.selectedRegionCategoryType = RegionCategoryType.all,
    this.selectedRecommendCategory,
  });

  HomeState copyWith({
    bool? isLoading,
    List<TopicCourse>? topicCourse,
    List<Category>? regionCategories,
    List<Category>? recommendCategories,
    List<Course>? filterRegionCourse,
    List<Course>? filterRecommendCourse,
    List<Course>? inProgressCourse,
    int? expandedTopicId,
    RegionCategoryType? selectedRegionCategoryType,
    Category? selectedRecommendCategory,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      topicCourse: topicCourse ?? this.topicCourse,
      recommendCategories: recommendCategories ?? this.recommendCategories,
      filterRegionCourse: filterRegionCourse ?? this.filterRegionCourse,
      filterRecommendCourse:
          filterRecommendCourse ?? this.filterRecommendCourse,
      inProgressCourse: inProgressCourse ?? this.inProgressCourse,
      expandedTopicId: expandedTopicId ?? this.expandedTopicId,
      selectedRegionCategoryType:
          selectedRegionCategoryType ?? this.selectedRegionCategoryType,
      selectedRecommendCategory:
          selectedRecommendCategory ?? this.selectedRecommendCategory,
    );
  }

  HomeState expaned({
    int? expandedTopicId,
  }) {
    return HomeState(
      isLoading: isLoading,
      topicCourse: topicCourse,
      recommendCategories: recommendCategories,
      filterRegionCourse: filterRegionCourse,
      filterRecommendCourse: filterRecommendCourse,
      inProgressCourse: inProgressCourse,
      expandedTopicId: expandedTopicId,
      selectedRegionCategoryType: selectedRegionCategoryType,
      selectedRecommendCategory: selectedRecommendCategory,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        topicCourse,
        recommendCategories,
        filterRegionCourse,
        filterRecommendCourse,
        inProgressCourse,
        expandedTopicId,
        selectedRegionCategoryType,
        selectedRecommendCategory,
      ];
}
