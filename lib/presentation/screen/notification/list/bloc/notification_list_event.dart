part of 'notification_list_bloc.dart';

sealed class NotificationListEvent extends Equatable {
  const NotificationListEvent();

  const factory NotificationListEvent.initial() = NotificationListOnInitial;

  @override
  List<Object> get props => [];
}

class NotificationListOnInitial extends NotificationListEvent {
  const NotificationListOnInitial();
}
