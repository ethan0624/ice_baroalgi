import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/extension/extension.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/usecase/auth/login.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends BaseSideEffectBloc<LoginEvent, LoginState> {
  final _login = getIt<Login>();
  LoginBloc() : super(const LoginState()) {
    on<LoginOnLogin>((event, emit) async {
      if (state.isLoading) return;

      emit(state.copyWith(isLoading: true));

      final res = await _login(email: event.email, password: event.password);

      emit(state.copyWith(isLoading: false));
      final user = res.tryGetSuccess();

      if (res.isError() || user == null) {
        produceSideEffect(BlocEffect.showAlert(
            title: res.tryGetError()?.message ?? 'fail login'));
        return;
      }

      produceSideEffect(const SuccessEffect());
    });
  }
}
