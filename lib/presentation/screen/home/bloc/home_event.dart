part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  const factory HomeEvent.initial() = HomeOnInitial;

  @override
  List<Object> get props => [];
}

class HomeOnInitial extends HomeEvent {
  const HomeOnInitial();
}
