part of 'withdraw_bloc.dart';

sealed class WithdrawEvent extends Equatable {
  const WithdrawEvent();

  const factory WithdrawEvent.withdraw() = WithdrawOnWithdraw;

  @override
  List<Object> get props => [];
}

class WithdrawOnWithdraw extends WithdrawEvent {
  const WithdrawOnWithdraw();
}
