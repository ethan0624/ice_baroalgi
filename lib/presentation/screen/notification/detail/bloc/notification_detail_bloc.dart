import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'notification_detail_event.dart';
part 'notification_detail_state.dart';

class NotificationDetailBloc extends BaseSideEffectBloc<NotificationDetailEvent,
    NotificationDetailState> {
  NotificationDetailBloc() : super(const NotificationDetailState()) {
    on<NotificationDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
