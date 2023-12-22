part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();

  const factory AccountEvent.initial() = AccountOnInitial;
  const factory AccountEvent.logout() = AccountOnLogout;

  @override
  List<Object> get props => [];
}

class AccountOnInitial extends AccountEvent {
  const AccountOnInitial();
}

class AccountOnLogout extends AccountEvent {
  const AccountOnLogout();
}
