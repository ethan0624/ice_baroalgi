part of 'notice_bloc.dart';

sealed class NoticeEvent extends Equatable {
  const NoticeEvent();

  const factory NoticeEvent.initial() = NoticeOnInitial;

  @override
  List<Object> get props => [];
}

class NoticeOnInitial extends NoticeEvent {
  const NoticeOnInitial();
}
