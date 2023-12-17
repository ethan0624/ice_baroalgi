part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();

  const factory AccountEvent.logout() = AccountOnLogout;

  @override
  List<Object> get props => [];
}

class AccountOnLogout extends AccountEvent {
  const AccountOnLogout();
}
