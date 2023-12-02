import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'reseet_pw_event.dart';
part 'reseet_pw_state.dart';

class ReseetPwBloc extends BaseSideEffectBloc<ReseetPwEvent, ReseetPwState> {
  ReseetPwBloc() : super(const ReseetPwState()) {
    on<ReseetPwEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
