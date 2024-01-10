import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/usecase/auth/update_jinro_account.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'jinro_account_event.dart';
part 'jinro_account_state.dart';

class JinroAccountBloc
    extends BaseSideEffectBloc<JinroAccountEvent, JinroAccountState> {
  final _authProvider = getIt<AuthProvider>();
  final _updateJinroAccount = getIt<UpdateJinroAccount>();

  JinroAccountBloc() : super(const JinroAccountState()) {
    on<JinroAccountOnSkip>((event, emit) async {
      await _authProvider.updateSkipJinroAccountRegist();

      produceSideEffect(const SuccessEffect());
    });

    on<JinroAccountOnRegist>((event, emit) async {
      if (state.isLoading) return;

      emit(state.copyWith(isLoading: true));

      final res = await _updateJinroAccount(email: event.email);

      emit(state.copyWith(isLoading: false));

      if (res.isSuccess()) {
        produceSideEffect(const SuccessEffect());
      }

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: '연동실패', message: '일치하는 회원정보를 찾을 수 없습니다'));
      }
    });
  }
}
