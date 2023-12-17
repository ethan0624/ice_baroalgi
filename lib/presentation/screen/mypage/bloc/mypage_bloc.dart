import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'mypage_event.dart';
part 'mypage_state.dart';

class MypageBloc extends BaseSideEffectBloc<MypageEvent, MypageState> {
  final _authProvider = getIt<AuthProvider>();

  MypageBloc() : super(const MypageState()) {
    on<MypageOnInitial>((event, emit) async {
      emit(state.copyWith(userMe: _authProvider.userMe));
    });
  }
}
