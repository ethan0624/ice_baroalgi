import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

class BlocSideEffectConsumer<
    SB extends SideEffectProvider<EFFECT>,
    B extends StateStreamable<STATE>,
    STATE,
    EFFECT> extends BlocSideEffectListener<SB, EFFECT> {
  BlocSideEffectConsumer({
    super.key,
    required super.listener,
    super.bloc,
    required BlocWidgetBuilder<STATE> builder,
  }) : super(child: BlocBuilder<B, STATE>(builder: builder));
}
