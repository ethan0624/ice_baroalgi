part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  const factory SplashEvent.initial() = SplashOnInitial;

  @override
  List<Object> get props => [];
}

class SplashOnInitial extends SplashEvent {
  const SplashOnInitial();
}
