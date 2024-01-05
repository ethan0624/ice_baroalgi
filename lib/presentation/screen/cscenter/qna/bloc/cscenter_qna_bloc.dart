import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/faq.dart';
import 'package:incheon_knowhow/domain/usecase/etc/find_faq.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'cscenter_qna_event.dart';
part 'cscenter_qna_state.dart';

class CscenterQnaBloc
    extends BaseSideEffectBloc<CscenterQnaEvent, CscenterQnaState> {
  final _findFaq = getIt<FindFaq>();
  final _allFaqList = [];
  CscenterQnaBloc() : super(const CscenterQnaState()) {
    on<CscenterQnaOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      // faq category fetch

      final res = await _findFaq();
      _allFaqList.addAll(res.tryGetSuccess()?.faqs ?? []);

      emit(state.copyWith(
        isLoading: false,
        faqList: res.tryGetSuccess()?.faqs,
      ));
    });

    on<CscenterQnaOnChangedCategory>((event, emit) {
      // filter category
    });
  }
}
