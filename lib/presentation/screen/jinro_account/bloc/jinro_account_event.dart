part of 'jinro_account_bloc.dart';

sealed class JinroAccountEvent extends Equatable {
  const JinroAccountEvent();

  const factory JinroAccountEvent.skip() = JinroAccountOnSkip;
  const factory JinroAccountEvent.regist(String email) = JinroAccountOnRegist;

  @override
  List<Object> get props => [];
}

class JinroAccountOnSkip extends JinroAccountEvent {
  const JinroAccountOnSkip();
}

class JinroAccountOnRegist extends JinroAccountEvent {
  final String email;
  const JinroAccountOnRegist(this.email);
}
