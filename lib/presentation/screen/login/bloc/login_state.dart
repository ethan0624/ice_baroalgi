part of 'login_bloc.dart';

class LoginState extends BaseState {
  const LoginState({
    super.isLoading,
  });

  copyWith({
    bool? isLoading,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
