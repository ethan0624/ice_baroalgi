import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'join_regist_event.dart';
part 'join_regist_state.dart';

class JoinRegistBloc
    extends BaseSideEffectBloc<JoinRegistEvent, JoinRegistState> {
  JoinRegistBloc() : super(const JoinRegistState()) {
    on<JoinRegistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
