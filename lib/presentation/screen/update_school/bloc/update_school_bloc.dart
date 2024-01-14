import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/usecase/auth/update_school.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';

part 'update_school_event.dart';
part 'update_school_state.dart';

class UpdateSchoolBloc
    extends BaseSideEffectBloc<UpdateSchoolEvent, UpdateSchoolState> {
  final _updateSchool = getIt<UpdateSchool>();
  UpdateSchoolBloc() : super(const UpdateSchoolState()) {
    on<UpdateSchoolOnSave>((event, emit) async {
      if (state.isLoading) return;

      emit(state.copyWith(isLoading: true));

      final res = await _updateSchool(
        school: event.schoolName,
        grade: event.schoolGrade,
        group: event.schoolClass,
      );

      emit(state.copyWith(isLoading: false));

      produceSideEffect(res.isSuccess()
          ? const SuccessEffect()
          : BlocEffect.showAlert(title: '학교정보 수정을 실패하였습니다'.tr()));
    });
  }
}
