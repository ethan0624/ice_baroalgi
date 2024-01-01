part of 'withdraw_bloc.dart';

class WithdrawState extends BaseState {
  const WithdrawState({
    super.isLoading,
  });

  copyWith({
    bool? isLoading,
  }) {
    return WithdrawState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
