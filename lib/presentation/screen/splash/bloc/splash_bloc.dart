import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/usecase/auth/get_user_info.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends BaseSideEffectBloc<SplashEvent, SplashState> {
  final _authProvider = getIt<AuthProvider>();
  final _getUserInfo = getIt<GetUserInfo>();

  SplashBloc() : super(const SplashState()) {
    on<SplashOnInitial>((event, emit) async {
      // 저장된 토큰이 있을 경우 사용자정보를 불러온다.
      if (_authProvider.hasToken()) {
        final res = await _getUserInfo();
        final user = res.tryGetSuccess();
        if (res.isSuccess() && user != null) {
          _authProvider.updateUser(user: user);
        } else {
          // 사용자 정보를 불러오지 못할 경우 로그아웃 처리한다.
          _authProvider.logout();
        }
      }

      produceSideEffect(BlocEffect.replaceNamed('/main'));
    });
  }
}
