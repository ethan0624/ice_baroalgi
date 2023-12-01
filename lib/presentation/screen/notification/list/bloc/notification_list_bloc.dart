import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'notification_list_event.dart';
part 'notification_list_state.dart';

class NotificationListBloc
    extends BaseSideEffectBloc<NotificationListEvent, NotificationListState> {
  NotificationListBloc() : super(const NotificationListState()) {
    on<NotificationListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
