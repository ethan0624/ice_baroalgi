import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/extension/extension.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/qna.dart';
import 'package:incheon_knowhow/domain/usecase/etc/find_qna.dart';
import 'package:incheon_knowhow/domain/usecase/etc/insert_qna.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'inquiry_event.dart';
part 'inquiry_state.dart';

class InquiryBloc extends BaseSideEffectBloc<InquiryEvent, InquiryState> {
  final _findQna = getIt<FindQna>();
  final _insertQna = getIt<InsertQna>();
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
      if (state.isLoading) return;

      emit(state.copyWith(isLoading: true));

      final res = await _insertQna(
        title: event.title,
        question: event.content,
        files: event.files,
      );

      emit(state.copyWith(isLoading: false));

      if (res.isSuccess()) {
        produceSideEffect(const SuccessEffect());
        return;
      }

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: res.tryGetError()?.message ?? 'unknow error'));
      }
    });
  }
}
