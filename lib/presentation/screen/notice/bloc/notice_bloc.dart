import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/notice.dart';
import 'package:incheon_knowhow/domain/usecase/etc/find_notice.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'notice_event.dart';
part 'notice_state.dart';

class NoticeBloc extends BaseSideEffectBloc<NoticeEvent, NoticeState> {
  final _findNotice = getIt<FindNotice>();
  NoticeBloc() : super(const NoticeState()) {
    on<NoticeOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _findNotice();
      final paging = res.tryGetSuccess();

      emit(state.copyWith(
        isLoading: false,
        totalCount: paging?.total,
        notices: paging?.notices,
      ));
    });
  }
}
