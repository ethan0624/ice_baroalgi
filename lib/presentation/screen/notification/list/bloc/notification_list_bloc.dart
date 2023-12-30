import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/push.dart';
import 'package:incheon_knowhow/domain/usecase/etc/find_push.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'notification_list_event.dart';
part 'notification_list_state.dart';

class NotificationListBloc
    extends BaseSideEffectBloc<NotificationListEvent, NotificationListState> {
  final _findPush = getIt<FindPush>();
  NotificationListBloc() : super(const NotificationListState()) {
    on<NotificationListOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _findPush();

      emit(state.copyWith(
        isLoading: false,
        pushMessges: res.tryGetSuccess(),
      ));
    });
  }
}
