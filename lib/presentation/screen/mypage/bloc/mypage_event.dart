part of 'mypage_bloc.dart';

sealed class MypageEvent extends Equatable {
  const MypageEvent();

  const factory MypageEvent.initial() = MypageOnInitial;
  const factory MypageEvent.refresh() = MypageOnRefresh;

  @override
  List<Object> get props => [];
}

class MypageOnInitial extends MypageEvent {
  const MypageOnInitial();
}

class MypageOnRefresh extends MypageEvent {
  const MypageOnRefresh();
}
