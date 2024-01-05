part of 'cscenter_qna_bloc.dart';

sealed class CscenterQnaEvent extends Equatable {
  const CscenterQnaEvent();

  const factory CscenterQnaEvent.initial() = CscenterQnaOnInitial;
  const factory CscenterQnaEvent.changeCategory(int categoryId) =
      CscenterQnaOnChangedCategory;

  @override
  List<Object> get props => [];
}

class CscenterQnaOnInitial extends CscenterQnaEvent {
  const CscenterQnaOnInitial();
}

class CscenterQnaOnChangedCategory extends CscenterQnaEvent {
  final int categoryId;
  const CscenterQnaOnChangedCategory(this.categoryId);
}
