part of 'update_phone_bloc.dart';

class UpdatePhoneState extends BaseState {
  const UpdatePhoneState({super.isLoading});

  copyWith({
    bool? isLoading,
  }) {
    return UpdatePhoneState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
