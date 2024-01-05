part of 'spot_detail_bloc.dart';

sealed class SpotDetailEvent extends Equatable {
  const SpotDetailEvent();

  const factory SpotDetailEvent.initial() = SpotDetailOnInitial;

  @override
  List<Object> get props => [];
}

class SpotDetailOnInitial extends SpotDetailEvent {
  const SpotDetailOnInitial();
}
