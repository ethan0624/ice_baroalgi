import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'notice_event.dart';
part 'notice_state.dart';

class NoticeBloc extends BaseSideEffectBloc<NoticeEvent, NoticeState> {
  NoticeBloc() : super(const NoticeState()) {
    on<NoticeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
