part of 'account_bloc.dart';

class AccountState extends BaseState {
  final User? user;
  const AccountState({
    super.isLoading,
    this.user,
  });

  copyWith({
    bool? isLoading,
    User? user,
  }) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [isLoading, user];
}
