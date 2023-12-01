import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends BaseSideEffectBloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
