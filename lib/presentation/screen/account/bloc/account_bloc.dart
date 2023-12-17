import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends BaseSideEffectBloc<AccountEvent, AccountState> {
  final _authProvider = getIt<AuthProvider>();

  AccountBloc() : super(const AccountState()) {
    on<AccountOnLogout>((event, emit) async {
      await _authProvider.logout();

      produceSideEffect(const SuccessEffect());
    });
  }
}
