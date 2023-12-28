import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/certification_code.dart';
import 'package:incheon_knowhow/domain/usecase/auth/send_certification_code.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'reset_pw_event.dart';
part 'reset_pw_state.dart';

class ResetPwBloc extends BaseSideEffectBloc<ResetPwEvent, ResetPwState> {
  final _sendCertificationCode = getIt<SendCertificationCode>();

  ResetPwBloc() : super(const ResetPwState()) {
    on<ResetPwOnFindUser>((event, emit) async {
      if (state.isLoading) return;

      emit(state.copyWith(isLoading: true));

      final res =
          await _sendCertificationCode(name: event.name, email: event.email);

      emit(state.copyWith(isLoading: false));

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: '회원정보 조회 실패', message: '일치하는 회원정보가 없습니다'));
        return;
      }

      final certificationCode = res.tryGetSuccess();
      if (certificationCode != null) {
        produceSideEffect(
            SuccessEffect<CertificationCode>(data: certificationCode));
      }
    });
  }
}
