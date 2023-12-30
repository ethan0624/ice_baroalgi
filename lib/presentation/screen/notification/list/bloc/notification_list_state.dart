part of 'notification_list_bloc.dart';

class NotificationListState extends BaseState {
  final List<Push> pushMessges;
  const NotificationListState({
    super.isLoading,
    this.pushMessges = const [],
  });

  copyWith({
    bool? isLoading,
    List<Push>? pushMessges,
  }) {
    return NotificationListState(
      isLoading: isLoading ?? this.isLoading,
      pushMessges: pushMessges ?? this.pushMessges,
    );
  }

  @override
  List<Object> get props => [isLoading, pushMessges];
}
