import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/usecase/auth/verify_password.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'verify_pw_event.dart';
part 'verify_pw_state.dart';

class VerifyPwBloc extends BaseSideEffectBloc<VerifyPwEvent, VerifyPwState> {
  final _verifyPassoword = getIt<VerifyPassword>();
  VerifyPwBloc() : super(const VerifyPwState()) {
    on<VerifyPwOnConfirm>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _verifyPassoword(password: event.password);
      emit(state.copyWith(isLoading: false));

      if (res.isError()) {
        produceSideEffect(const SuccessEffect());
        return;
      }

      produceSideEffect(
          BlocEffect.showAlert(title: '비밀번호 확인', message: '비밀번호가 일치하지 않습니다'));
    });
  }
}
