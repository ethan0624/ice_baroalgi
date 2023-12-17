part of 'mypage_bloc.dart';

sealed class MypageEvent extends Equatable {
  const MypageEvent();

  const factory MypageEvent.initial() = MypageOnInitial;

  @override
  List<Object> get props => [];
}

class MypageOnInitial extends MypageEvent {
  const MypageOnInitial();
}
