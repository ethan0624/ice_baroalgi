import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/usecase/auth/withdraw.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'withdraw_event.dart';
part 'withdraw_state.dart';

class WithdrawBloc extends BaseSideEffectBloc<WithdrawEvent, WithdrawState> {
  final _withdraw = getIt<Withdraw>();
  WithdrawBloc() : super(const WithdrawState()) {
    on<WithdrawOnWithdraw>((event, emit) async {
      if (state.isLoading) return;

      final res = await _withdraw();

      if (res.isSuccess()) {
        produceSideEffect(BlocEffect.showAlert(
          title: '로그아웃',
          message: '그동안 서비스를 이용해주셔서 감사합니다.\n보다 나은 서비스로 다시 찾아뵙겠습니다.',
        ));
      }
    });
  }
}
