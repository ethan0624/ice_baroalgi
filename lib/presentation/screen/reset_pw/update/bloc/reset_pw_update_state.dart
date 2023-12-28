part of 'reset_pw_update_bloc.dart';

class ResetPwUpdateState extends BaseState {
  const ResetPwUpdateState({super.isLoading});

  copyWith({
    bool? isLoading,
  }) {
    return ResetPwUpdateState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
