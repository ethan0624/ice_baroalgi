part of 'mypage_bloc.dart';

class MypageState extends BaseState {
  final User? userMe;

  const MypageState({
    super.isLoading,
    this.userMe,
  });

  copyWith({
    bool? isLoading,
    User? userMe,
  }) {
    return MypageState(
      isLoading: isLoading ?? this.isLoading,
      userMe: userMe ?? this.userMe,
    );
  }

  @override
  List<Object?> get props => [isLoading, userMe];
}
