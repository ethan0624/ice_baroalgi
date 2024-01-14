import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/model/faq.dart';
import 'package:incheon_knowhow/domain/usecase/category/find_qna_categories.dart';
import 'package:incheon_knowhow/domain/usecase/etc/find_faq.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'cscenter_qna_event.dart';
part 'cscenter_qna_state.dart';

class CscenterQnaBloc
    extends BaseSideEffectBloc<CscenterQnaEvent, CscenterQnaState> {
  final _findQnaCategories = getIt<FindQnaCategoreis>();
  final _findFaq = getIt<FindFaq>();
  final List<Faq> _allFaqList = [];
  CscenterQnaBloc() : super(const CscenterQnaState()) {
    on<CscenterQnaOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      // faq category fetch
      final categoryRes = await _findQnaCategories();

      final categories = categoryRes.tryGetSuccess() ?? [];
      final firstCategory = categories.firstOrNull;

      final res = await _findFaq();
      _allFaqList.addAll(res.tryGetSuccess()?.faqs ?? []);

      emit(state.copyWith(
        isLoading: false,
        categories: categories,
      ));

      if (firstCategory != null) {
        add(CscenterQnaEvent.changeCategory(firstCategory.id));
      }
    });

    on<CscenterQnaOnChangedCategory>((event, emit) {
      emit(state.copyWith(
        isLoading: false,
        selectedCategoryId: event.categoryId,
        faqList:
            _allFaqList.where((e) => e.categoryId == event.categoryId).toList(),
      ));
    });
  }
}
