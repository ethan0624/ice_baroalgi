part of 'join_regist_bloc.dart';

class JoinRegistState extends BaseState {
  final bool canUseEmail;
  final bool isDuplicateRequest;
  const JoinRegistState({
    super.isLoading,
    this.canUseEmail = false,
    this.isDuplicateRequest = false,
  });

  copyWith({bool? isLoading, bool? canUseEmail, bool? isDuplicateRequest}) {
    return JoinRegistState(
      isLoading: isLoading ?? this.isLoading,
      canUseEmail: canUseEmail ?? this.canUseEmail,
      isDuplicateRequest: isDuplicateRequest ?? this.isDuplicateRequest,
    );
  }

  @override
  List<Object> get props => [isLoading, canUseEmail, isDuplicateRequest];
}
