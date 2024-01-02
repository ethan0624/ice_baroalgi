part of 'update_school_bloc.dart';

class UpdateSchoolState extends BaseState {
  const UpdateSchoolState({
    super.isLoading,
  });

  copyWith({
    bool? isLoading,
  }) {
    return UpdateSchoolState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
