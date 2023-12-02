import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'reset_pw_certification_event.dart';
part 'reset_pw_certification_state.dart';

class ResetPwCertificationBloc extends BaseSideEffectBloc<
    ResetPwCertificationEvent, ResetPwCertificationState> {
  ResetPwCertificationBloc() : super(const ResetPwCertificationState()) {
    on<ResetPwCertificationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
