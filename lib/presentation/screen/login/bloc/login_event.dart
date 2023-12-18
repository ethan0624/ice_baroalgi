part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  const factory LoginEvent.login(String email, String password) = LoginOnLogin;

  @override
  List<Object> get props => [];
}

class LoginOnLogin extends LoginEvent {
  final String email;
  final String password;
  const LoginOnLogin(this.email, this.password);
}
