import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'stamp_regist_event.dart';
part 'stamp_regist_state.dart';

class StampRegistBloc
    extends BaseSideEffectBloc<StampRegistEvent, StampRegistState> {
  StampRegistBloc() : super(const StampRegistState()) {
    on<StampRegistEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
