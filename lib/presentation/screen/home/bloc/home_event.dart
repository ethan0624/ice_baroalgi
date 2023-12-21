part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  const factory HomeEvent.initial() = HomeOnInitial;

  const factory HomeEvent.changeRegion(List<Category> regions) =
      HomeOnChangedRegon;

  @override
  List<Object> get props => [];
}

class HomeOnInitial extends HomeEvent {
  const HomeOnInitial();
}

class HomeOnChangedRegon extends HomeEvent {
  final List<Category> regions;
  const HomeOnChangedRegon(this.regions);
}
