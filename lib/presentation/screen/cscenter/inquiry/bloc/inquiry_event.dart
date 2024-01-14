part of 'inquiry_bloc.dart';

sealed class InquiryEvent extends Equatable {
  const InquiryEvent();

  const factory InquiryEvent.initial() = InquiryOnInitial;
  const factory InquiryEvent.request({
    required String title,
    required String content,
    List<File> files,
  }) = InquiryOnRequest;

  @override
  List<Object> get props => [];
}

class InquiryOnInitial extends InquiryEvent {
  const InquiryOnInitial();
}

class InquiryOnRequest extends InquiryEvent {
  final String title;
  final String content;
  final List<File> files;
  const InquiryOnRequest({
    required this.title,
    required this.content,
    this.files = const [],
  });
}
