part of 'reset_pw_bloc.dart';

class ResetPwState extends BaseState {
  const ResetPwState({
    super.isLoading,
  });

  copyWith({
    bool? isLoading,
  }) {
    return ResetPwState(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [isLoading];
}
