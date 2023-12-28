part of 'reset_pw_bloc.dart';

sealed class ResetPwEvent extends Equatable {
  const ResetPwEvent();

  const factory ResetPwEvent.find(String name, String email) =
      ResetPwOnFindUser;

  @override
  List<Object> get props => [];
}

class ResetPwOnFindUser extends ResetPwEvent {
  final String name;
  final String email;
  const ResetPwOnFindUser(this.name, this.email);
}
