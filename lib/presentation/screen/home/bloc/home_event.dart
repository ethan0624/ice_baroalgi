part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  const factory HomeEvent.initial() = HomeOnInitial;

  const factory HomeEvent.expanededTopic(int topicId, bool isExpanded) =
      HomeOnExpanededTopic;
  const factory HomeEvent.changeRegion(RegionCategoryType regionCategoryType) =
      HomeOnChangedRegon;
  const factory HomeEvent.changeRecommend(Category category) =
      HomeOnChangedRecommend;

  @override
  List<Object> get props => [];
}

class HomeOnInitial extends HomeEvent {
  const HomeOnInitial();
}

class HomeOnExpanededTopic extends HomeEvent {
  final int topicId;
  final bool isExpanded;
  const HomeOnExpanededTopic(this.topicId, this.isExpanded);
}

class HomeOnChangedRegon extends HomeEvent {
  final RegionCategoryType regionCategoryType;
  const HomeOnChangedRegon(this.regionCategoryType);
}

class HomeOnChangedRecommend extends HomeEvent {
  final Category category;
  const HomeOnChangedRecommend(this.category);
}
