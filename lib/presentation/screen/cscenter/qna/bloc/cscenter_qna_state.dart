part of 'cscenter_qna_bloc.dart';

class CscenterQnaState extends BaseState {
  final List<Faq> faqList;
  const CscenterQnaState({
    super.isLoading,
    this.faqList = const [],
  });

  copyWith({
    bool? isLoading,
    List<Faq>? faqList,
  }) {
    return CscenterQnaState(
      isLoading: isLoading ?? this.isLoading,
      faqList: faqList ?? this.faqList,
    );
  }

  @override
  List<Object> get props => [isLoading, faqList];
}
