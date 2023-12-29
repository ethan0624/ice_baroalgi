part of 'notice_bloc.dart';

class NoticeState extends BaseState {
  final int totalCount;
  final List<Notice> notices;

  const NoticeState({
    super.isLoading,
    this.totalCount = 0,
    this.notices = const [],
  });

  copyWith({
    bool? isLoading,
    int? totalCount,
    List<Notice>? notices,
  }) {
    return NoticeState(
      isLoading: isLoading ?? this.isLoading,
      totalCount: totalCount ?? this.totalCount,
      notices: notices ?? this.notices,
    );
  }

  @override
  List<Object> get props => [isLoading, totalCount, notices];
}
