import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'verify_pw_event.dart';
part 'verify_pw_state.dart';

class VerifyPwBloc extends BaseSideEffectBloc<VerifyPwEvent, VerifyPwState> {
  VerifyPwBloc() : super(const VerifyPwState()) {
    on<VerifyPwOnConfirm>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      // todo : check api
      await Future.delayed(const Duration(seconds: 1));

      produceSideEffect(const SuccessEffect());
    });
  }
}
