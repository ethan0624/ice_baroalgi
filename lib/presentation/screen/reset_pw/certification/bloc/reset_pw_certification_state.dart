part of 'reset_pw_certification_bloc.dart';

class ResetPwCertificationState extends BaseState {
  final bool isCertificationCodeSuccess;
  final bool isCertificationCodeFail;
  const ResetPwCertificationState({
    super.isLoading,
    this.isCertificationCodeSuccess = false,
    this.isCertificationCodeFail = false,
  });

  copyWith({
    bool? isLoading,
    bool? isCertificationCodeSuccess,
    bool? isCertificationCodeFail,
  }) {
    return ResetPwCertificationState(
      isLoading: isLoading ?? this.isLoading,
      isCertificationCodeSuccess:
          isCertificationCodeSuccess ?? this.isCertificationCodeSuccess,
      isCertificationCodeFail:
          isCertificationCodeFail ?? this.isCertificationCodeFail,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isCertificationCodeSuccess,
        isCertificationCodeFail,
      ];
}
