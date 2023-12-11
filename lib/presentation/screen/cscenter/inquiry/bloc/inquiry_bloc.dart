import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'inquiry_event.dart';
part 'inquiry_state.dart';

class InquiryBloc extends BaseSideEffectBloc<InquiryEvent, InquiryState> {
  InquiryBloc() : super(const InquiryState()) {
    on<InquiryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
