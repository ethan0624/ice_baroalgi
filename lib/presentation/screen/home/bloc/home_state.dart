part of 'home_bloc.dart';

class HomeState extends BaseState {
  final List<Category> topicCategories;
  final List<Category> recommendCategories;
  final List<Course> filterRegionCourse;
  final Category? expandedTopicCategory;
  final RegionCategoryType selectedRegionCategoryType;
  final Category? selectedRecommendCategory;

  const HomeState({
    super.isLoading,
    this.topicCategories = const [],
    this.recommendCategories = const [],
    this.filterRegionCourse = const [],
    this.expandedTopicCategory,
    this.selectedRegionCategoryType = RegionCategoryType.all,
    this.selectedRecommendCategory,
  });

  HomeState copyWith({
    bool? isLoading,
    List<Category>? topicCategories,
    List<Category>? regionCategories,
    List<Category>? recommendCategories,
    List<Course>? filterRegionCourse,
    Category? expandedTopicCategory,
    RegionCategoryType? selectedRegionCategoryType,
    Category? selectedRecommendCategory,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      topicCategories: topicCategories ?? this.topicCategories,
      recommendCategories: recommendCategories ?? this.recommendCategories,
      filterRegionCourse: filterRegionCourse ?? this.filterRegionCourse,
      expandedTopicCategory:
          expandedTopicCategory ?? this.expandedTopicCategory,
      selectedRegionCategoryType:
          selectedRegionCategoryType ?? this.selectedRegionCategoryType,
      selectedRecommendCategory:
          selectedRecommendCategory ?? this.selectedRecommendCategory,
    );
  }

  HomeState expaned({
    Category? expandedTopicCategory,
  }) {
    return HomeState(
      isLoading: isLoading,
      topicCategories: topicCategories,
      recommendCategories: recommendCategories,
      filterRegionCourse: filterRegionCourse,
      expandedTopicCategory: expandedTopicCategory,
      selectedRegionCategoryType: selectedRegionCategoryType,
      selectedRecommendCategory: selectedRecommendCategory,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        topicCategories,
        recommendCategories,
        filterRegionCourse,
        expandedTopicCategory,
        selectedRegionCategoryType,
        selectedRecommendCategory,
      ];
}
