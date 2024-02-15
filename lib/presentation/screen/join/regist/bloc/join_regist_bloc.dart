import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/data/request/user_register_request.dart';
import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:incheon_knowhow/domain/usecase/auth/duplicate_email.dart';
import 'package:incheon_knowhow/domain/usecase/auth/regist_user.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';

part 'join_regist_event.dart';
part 'join_regist_state.dart';

class JoinRegistBloc
    extends BaseSideEffectBloc<JoinRegistEvent, JoinRegistState> {
  final _duplicateEmail = getIt<DuplicateEmail>();
  final _registUser = getIt<RegistUser>();

  final JoinData joinData;
  String _duplicateCheckedEmail = '';

  JoinRegistBloc({
    required this.joinData,
  }) : super(const JoinRegistState()) {
    on<JoinRegistOnChangedEmail>((event, emit) {
      emit(state.copyWith(
        isDuplicateRequest: false,
        canUseEmail: false,
      ));
    });

    on<JoinRegistOnDuplicateEmailCheck>((event, emit) async {
      if (state.isLoading) return;

      emit(state.copyWith(
        isLoading: true,
        isDuplicateRequest: false,
      ));

      _duplicateCheckedEmail = '';

      final res = await _duplicateEmail(email: event.email);

      if (res.isSuccess()) {
        _duplicateCheckedEmail = event.email;
      }

      emit(state.copyWith(
        isLoading: false,
        isDuplicateRequest: true,
        canUseEmail: res.tryGetSuccess() ?? false,
      ));
    });

    on<JoinRegistOnSave>((event, emit) async {
      if (state.isLoading) return;

      if (_duplicateCheckedEmail != event.email) {
        produceSideEffect(BlocEffect.showAlert(
          title: '이메일 오류'.tr(),
          message: '이메일 중복확인을 해주세요'.tr(),
        ));
        return;
      }

      emit(state.copyWith(isLoading: true));

      final request = UserRegisterRequest(
        type: joinData.type,
        email: event.email,
        password: event.password,
        name: joinData.userName ?? '',
        gender: joinData.userGender ?? UserGenderType.male,
        birth: joinData.userBirthday ?? '',
        phone: joinData.userPhoneNumber ?? '',
        schoolName: event.schoolName,
        schoolGrade: event.schoolGrade,
        schoolClass: event.schoolClass,
        isFourteenOver: joinData.isFourteenOver,
        isAgreedMinor: joinData.isAgreedMinor,
        isAgreedGps: joinData.isAgreedLocation,
        parentName: joinData.parentName,
        parentGender: joinData.parentGender,
        parentBirth: joinData.parentBirthday,
        parentPhone: joinData.parentBirthday,
      );
      final res = await _registUser(request);

      emit(state.copyWith(isLoading: false));

      if (res.isError()) {
        produceSideEffect(BlocEffect.showAlert(
            title: '회원가입 실패'.tr(), message: '회원가입처리에 실패하였습니다'.tr()));
        return;
      }

      produceSideEffect(const SuccessEffect());
    });
  }
}
