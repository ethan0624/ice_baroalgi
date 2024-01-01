part of 'verify_pw_bloc.dart';

class VerifyPwState extends BaseState {
  const VerifyPwState({
    super.isLoading,
  });

  copyWith({
    bool? isLoading,
  }) {
    return VerifyPwState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
