import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/push.dart';
import 'package:incheon_knowhow/domain/usecase/etc/update_push_read.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'notification_detail_event.dart';
part 'notification_detail_state.dart';

class NotificationDetailBloc extends BaseSideEffectBloc<NotificationDetailEvent,
    NotificationDetailState> {
  final _updatePushRead = getIt<UpdatePushRead>();
  final Push push;
  NotificationDetailBloc({required this.push})
      : super(const NotificationDetailState()) {
    on<NotificationDetailOnInitial>((event, emit) async {
      if (!push.isRead) {
        await _updatePushRead(push.id);
      }
    });
  }
}
