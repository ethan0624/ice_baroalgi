import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'reset_pw_update_event.dart';
part 'reset_pw_update_state.dart';

class ResetPwUpdateBloc
    extends BaseSideEffectBloc<ResetPwUpdateEvent, ResetPwUpdateState> {
  ResetPwUpdateBloc() : super(const ResetPwUpdateState()) {
    on<ResetPwUpdateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
