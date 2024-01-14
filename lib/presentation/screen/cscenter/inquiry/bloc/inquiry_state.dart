part of 'inquiry_bloc.dart';

class InquiryState extends BaseState {
  final List<Qna> qnaItems;

  const InquiryState({
    super.isLoading,
    this.qnaItems = const [],
  });

  copyWith({
    bool? isLoading,
    List<Qna>? qnaItems,
  }) {
    return InquiryState(
      isLoading: isLoading ?? this.isLoading,
      qnaItems: qnaItems ?? this.qnaItems,
    );
  }

  @override
  List<Object> get props => [isLoading, qnaItems];
}
