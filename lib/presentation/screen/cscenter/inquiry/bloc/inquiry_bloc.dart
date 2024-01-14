import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/qna.dart';
import 'package:incheon_knowhow/domain/usecase/etc/find_qna.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'inquiry_event.dart';
part 'inquiry_state.dart';

class InquiryBloc extends BaseSideEffectBloc<InquiryEvent, InquiryState> {
  final _findQna = getIt<FindQna>();
  InquiryBloc() : super(const InquiryState()) {
    on<InquiryOnInitial>((event, emit) async {
      final res = await _findQna.call();
      final qnas = res.tryGetSuccess()?.rows ?? [];

      emit(state.copyWith(
        isLoading: false,
        qnaItems: qnas,
      ));
    });

    on<InquiryOnRequest>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
