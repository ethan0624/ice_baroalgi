part of 'reset_pw_update_bloc.dart';

sealed class ResetPwUpdateEvent extends Equatable {
  const ResetPwUpdateEvent();

  const factory ResetPwUpdateEvent.submit(String password) =
      ResetPwUpdateOnSubmit;

  @override
  List<Object> get props => [];
}

class ResetPwUpdateOnSubmit extends ResetPwUpdateEvent {
  final String password;
  const ResetPwUpdateOnSubmit(this.password);
}
