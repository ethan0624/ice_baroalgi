part of 'reset_pw_certification_bloc.dart';

sealed class ResetPwCertificationEvent extends Equatable {
  const ResetPwCertificationEvent();

  const factory ResetPwCertificationEvent.resend() =
      ResetPwCertificationOnReSend;
  const factory ResetPwCertificationEvent.changeCode() =
      ResetPwCertificationOnChangedCode;
  const factory ResetPwCertificationEvent.check(String code) =
      ResetPwCertificationOnCheck;

  @override
  List<Object> get props => [];
}

class ResetPwCertificationOnReSend extends ResetPwCertificationEvent {
  const ResetPwCertificationOnReSend();
}

class ResetPwCertificationOnChangedCode extends ResetPwCertificationEvent {
  const ResetPwCertificationOnChangedCode();
}

class ResetPwCertificationOnCheck extends ResetPwCertificationEvent {
  final String code;
  const ResetPwCertificationOnCheck(this.code);
}
