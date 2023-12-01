import 'package:bloc/bloc.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

abstract class BaseSideEffectBloc<EVENT, STATE> extends Bloc<EVENT, STATE>
    with SideEffectBlocMixin<EVENT, STATE, BlocEffect> {
  BaseSideEffectBloc(STATE initialState) : super(initialState);
}
