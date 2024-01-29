part of 'stamp_regist_bloc.dart';

class StampRegistState extends BaseState {
  const StampRegistState({
    super.isLoading,
  });

  coypWith({
    bool? isLoading,
  }) {
    return StampRegistState(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [isLoading];
}
