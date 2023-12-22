part of 'find_id_bloc.dart';

class FindIdState extends BaseState {
  const FindIdState({super.isLoading});

  copyWith({
    bool? isLoading,
  }) {
    return FindIdState(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [isLoading];
}
