part of 'verify_pw_bloc.dart';

sealed class VerifyPwEvent extends Equatable {
  const VerifyPwEvent();

  const factory VerifyPwEvent.confrim(String password) = VerifyPwOnConfirm;

  @override
  List<Object> get props => [];
}

class VerifyPwOnConfirm extends VerifyPwEvent {
  final String password;
  const VerifyPwOnConfirm(this.password);
}
