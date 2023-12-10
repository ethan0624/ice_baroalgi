import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'cscenter_qna_event.dart';
part 'cscenter_qna_state.dart';

class CscenterQnaBloc
    extends BaseSideEffectBloc<CscenterQnaEvent, CscenterQnaState> {
  CscenterQnaBloc() : super(const CscenterQnaState()) {
    on<CscenterQnaEvent>((event, emit) {});
  }
}
