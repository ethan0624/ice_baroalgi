import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'update_phone_event.dart';
part 'update_phone_state.dart';

class UpdatePhoneBloc
    extends BaseSideEffectBloc<UpdatePhoneEvent, UpdatePhoneState> {
  UpdatePhoneBloc() : super(const UpdatePhoneState()) {
    on<UpdatePhoneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
