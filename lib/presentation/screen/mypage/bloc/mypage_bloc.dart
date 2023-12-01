import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'mypage_event.dart';
part 'mypage_state.dart';

class MypageBloc extends BaseSideEffectBloc<MypageEvent, MypageState> {
  MypageBloc() : super(const MypageState()) {
    on<MypageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
