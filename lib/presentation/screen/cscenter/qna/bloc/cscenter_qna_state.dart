part of 'cscenter_qna_bloc.dart';

class CscenterQnaState extends BaseState {
  final List<Category> categories;
  final List<Faq> faqList;
  final int? selectedCategoryId;
  const CscenterQnaState({
    super.isLoading,
    this.categories = const [],
    this.faqList = const [],
    this.selectedCategoryId,
  });

  copyWith({
    bool? isLoading,
    List<Category>? categories,
    List<Faq>? faqList,
    int? selectedCategoryId,
  }) {
    return CscenterQnaState(
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      faqList: faqList ?? this.faqList,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        categories,
        faqList,
        selectedCategoryId,
      ];
}
