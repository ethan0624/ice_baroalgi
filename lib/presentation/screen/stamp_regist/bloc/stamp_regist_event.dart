part of 'stamp_regist_bloc.dart';

sealed class StampRegistEvent extends Equatable {
  const StampRegistEvent();

  const factory StampRegistEvent.save(Map<int, String> answer) =
      StampRegistOnSave;

  @override
  List<Object> get props => [];
}

class StampRegistOnSave extends StampRegistEvent {
  final Map<int, String> answer;
  const StampRegistOnSave(this.answer);
}
