import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'find_id_event.dart';
part 'find_id_state.dart';

class FindIdBloc extends BaseSideEffectBloc<FindIdEvent, FindIdState> {
  FindIdBloc() : super(const FindIdState()) {
    on<FindIdEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
