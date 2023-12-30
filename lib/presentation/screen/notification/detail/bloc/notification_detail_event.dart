part of 'notification_detail_bloc.dart';

sealed class NotificationDetailEvent extends Equatable {
  const NotificationDetailEvent();

  const factory NotificationDetailEvent.initial() = NotificationDetailOnInitial;

  @override
  List<Object> get props => [];
}

class NotificationDetailOnInitial extends NotificationDetailEvent {
  const NotificationDetailOnInitial();
}
