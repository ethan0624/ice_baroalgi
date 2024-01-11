import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/find_id_result.dart';
import 'package:incheon_knowhow/domain/usecase/auth/find_user_id.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'find_id_event.dart';
part 'find_id_state.dart';

class FindIdBloc extends BaseSideEffectBloc<FindIdEvent, FindIdState> {
  final _findId = getIt<FindUserId>();
  FindIdBloc() : super(const FindIdState()) {
    on<FindIdOnRequest>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _findId(
          name: event.name,
          birth: event.birth.replaceAll('/', '-'),
          phone: event.phone.replaceAll('-', ''));

      emit(state.copyWith(isLoading: false));

      final result = res.tryGetSuccess();
      if (res.isError() || result == null) {
        produceSideEffect(BlocEffect.showAlert(
            title: '아이디찾기 실패'.tr(), message: '일치하는 회원을 찾을 수 없습니다'.tr()));
        return;
      }

      produceSideEffect(SuccessEffect<FindIdResult>(data: result));
    });
  }
}
