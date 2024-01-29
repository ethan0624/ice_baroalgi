import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/data/request/course_stamp_request.dart';
import 'package:incheon_knowhow/domain/usecase/course/request_stamp.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'stamp_regist_event.dart';
part 'stamp_regist_state.dart';

class StampRegistBloc
    extends BaseSideEffectBloc<StampRegistEvent, StampRegistState> {
  final _requestStamp = getIt<RequestStamp>();
  final int courseId;
  StampRegistBloc({required this.courseId}) : super(const StampRegistState()) {
    on<StampRegistOnSave>((event, emit) async {
      if (state.isLoading) return;

      emit(state.coypWith(isLoading: true));
      final answer = event.answer;
      final resuqest = CourseStampRequest(
        answer1: answer[1] ?? '',
        answer2: answer[2] ?? '',
        answer3: answer[3] ?? '',
        answer4: answer[4] ?? '',
        answer5: answer[5] ?? '',
        answer6: answer[6] ?? '',
        answer7_1: answer[71] ?? '',
        answer7_2: answer[72] ?? '',
        answer7_3: answer[73] ?? '',
        answer7_4: answer[74] ?? '',
      );
      final res = await _requestStamp(courseId: courseId, request: resuqest);

      emit(state.coypWith(isLoading: false));

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: '스탬프 발행 실패'.tr(), message: '스탬프 발행이 실패하였습니다'));
        return;
      }

      produceSideEffect(const SuccessEffect());
    });
  }
}
