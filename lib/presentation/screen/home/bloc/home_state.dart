part of 'home_bloc.dart';

class HomeState extends BaseState {
  final List<Category> topicCategories;
  final List<Category> regionCategories;
  final List<Category> recommendCategories;
  final List<Course> filterRegionCourse;

  const HomeState({
    super.isLoading,
    this.topicCategories = const [],
    this.regionCategories = const [],
    this.recommendCategories = const [],
    this.filterRegionCourse = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    List<Category>? topicCategories,
    List<Category>? regionCategories,
    List<Category>? recommendCategories,
    List<Course>? filterRegionCourse,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      topicCategories: topicCategories ?? this.topicCategories,
      regionCategories: regionCategories ?? this.regionCategories,
      recommendCategories: recommendCategories ?? this.recommendCategories,
      filterRegionCourse: filterRegionCourse ?? this.filterRegionCourse,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        topicCategories,
        regionCategories,
        recommendCategories,
        filterRegionCourse,
      ];
}
