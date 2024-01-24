import 'package:equatable/equatable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/usecase/auth/update_phone.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'update_phone_event.dart';
part 'update_phone_state.dart';

class UpdatePhoneBloc
    extends BaseSideEffectBloc<UpdatePhoneEvent, UpdatePhoneState> {
  final _updatePhone = getIt<UpdatePhone>();
  UpdatePhoneBloc() : super(const UpdatePhoneState()) {
    on<UpdatePhoneOnSave>((event, emit) async {
      if (state.isLoading) return;

      emit(state.copyWith(isLoading: true));

      final res = await _updatePhone(phoneNumber: event.phoneNumber);

      emit(state.copyWith(isLoading: false));

      produceSideEffect(res.isSuccess()
          ? const SuccessEffect()
          : BlocEffect.showAlert(title: '휴대폰번호 수정을 실패하였습니다'.tr()));
    });
  }
}
