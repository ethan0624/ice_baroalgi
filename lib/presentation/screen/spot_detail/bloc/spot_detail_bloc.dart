import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'spot_detail_event.dart';
part 'spot_detail_state.dart';

class SpotDetailBloc
    extends BaseSideEffectBloc<SpotDetailEvent, SpotDetailState> {
  SpotDetailBloc() : super(const SpotDetailState()) {
    on<SpotDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
