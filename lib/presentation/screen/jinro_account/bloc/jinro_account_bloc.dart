import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'jinro_account_event.dart';
part 'jinro_account_state.dart';

class JinroAccountBloc
    extends BaseSideEffectBloc<JinroAccountEvent, JinroAccountState> {
  JinroAccountBloc() : super(const JinroAccountState()) {
    on<JinroAccountEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
