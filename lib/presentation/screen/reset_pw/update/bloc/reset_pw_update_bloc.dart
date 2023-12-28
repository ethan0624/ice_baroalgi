import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/usecase/auth/update_password.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'reset_pw_update_event.dart';
part 'reset_pw_update_state.dart';

class ResetPwUpdateBloc
    extends BaseSideEffectBloc<ResetPwUpdateEvent, ResetPwUpdateState> {
  final _authProvider = getIt<AuthProvider>();
  final _updatePassword = getIt<UpdatePassword>();
  final int userId;
  ResetPwUpdateBloc({required this.userId})
      : super(const ResetPwUpdateState()) {
    on<ResetPwUpdateOnSubmit>((event, emit) async {
      if (state.isLoading) return;

      if (userId < 1) {
        produceSideEffect(
            BlocEffect.showAlert(title: '입력오류', message: '회원정보를 찾을 수 없습니다'));
        return;
      }

      emit(state.copyWith(isLoading: true));

      final res =
          await _updatePassword(userId: userId, changePassword: event.password);

      emit(state.copyWith(isLoading: false));

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: '비밀번호 변경 실패', message: '비밀번호를 변경할 수 없습니다'));
        return;
      }

      if (_authProvider.isAuthenticated()) {
        await _authProvider.logout();
      }

      produceSideEffect(const SuccessEffect());
    });
  }
}
