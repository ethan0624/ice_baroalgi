part of 'home_bloc.dart';

class HomeState extends BaseState {
  final List<Category> topicCategories;
  final List<Category> regionCategories;
  final List<Category> recommendCategories;
  const HomeState({
    super.isLoading,
    this.topicCategories = const [],
    this.regionCategories = const [],
    this.recommendCategories = const [],
  });

  @override
  List<Object> get props => [
        isLoading,
        topicCategories,
        regionCategories,
        recommendCategories,
      ];
}
