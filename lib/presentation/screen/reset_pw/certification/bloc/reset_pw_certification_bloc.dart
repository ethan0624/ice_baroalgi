import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/certification_code.dart';
import 'package:incheon_knowhow/domain/usecase/auth/send_certification_code.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'reset_pw_certification_event.dart';
part 'reset_pw_certification_state.dart';

class ResetPwCertificationBloc extends BaseSideEffectBloc<
    ResetPwCertificationEvent, ResetPwCertificationState> {
  final _sendCertificationCode = getIt<SendCertificationCode>();
  CertificationCode certificationCode;
  ResetPwCertificationBloc({required this.certificationCode})
      : super(const ResetPwCertificationState()) {
    on<ResetPwCertificationOnReSend>((event, emit) async {
      if (state.isLoading) return;

      if (!certificationCode.canResend) {
        produceSideEffect(
            BlocEffect.showAlert(title: '인증번호를 재발송할 수 없습니다'.tr()));
        return;
      }

      emit(state.copyWith(
        isLoading: true,
        isCertificationCodeFail: false,
        isCertificationCodeSuccess: false,
      ));

      final res = await _sendCertificationCode(
        email: certificationCode.email ?? '',
        name: certificationCode.name ?? '',
      );

      final certification = res.tryGetSuccess();
      if (res.isError() || certification == null) {
        produceSideEffect(
            BlocEffect.showAlert(title: '인증번호를 재발송을 실패했습니다'.tr()));
        return;
      }
      certificationCode = certification;
      emit(state.copyWith(isLoading: false));
    });

    on<ResetPwCertificationOnChangedCode>((event, emit) async {
      emit(state.copyWith(
        isCertificationCodeSuccess: false,
        isCertificationCodeFail: false,
      ));
    });

    on<ResetPwCertificationOnCheck>((event, emit) {
      bool isCodeSuccess = event.code == certificationCode.code;
      emit(state.copyWith(
        isCertificationCodeSuccess: isCodeSuccess,
        isCertificationCodeFail: !isCodeSuccess,
      ));
    });
  }
}
