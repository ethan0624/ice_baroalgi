part of 'jinro_account_bloc.dart';

class JinroAccountState extends BaseState {
  const JinroAccountState({
    super.isLoading,
  });

  copyWith({
    bool? isLoading,
  }) {
    return JinroAccountState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
