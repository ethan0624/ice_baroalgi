part of 'account_bloc.dart';

class AccountState extends BaseState {
  const AccountState({super.isLoading});

  copyWith({bool? isLoading}) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
