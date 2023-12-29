import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/usecase/auth/duplicate_email.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';

part 'join_regist_event.dart';
part 'join_regist_state.dart';

class JoinRegistBloc
    extends BaseSideEffectBloc<JoinRegistEvent, JoinRegistState> {
  final _duplicateEmail = getIt<DuplicateEmail>();

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
          title: '이메일오류',
          message: '이메일 중복확인을 해주세요',
        ));
        return;
      }

      emit(state.copyWith(isLoading: true));

      emit(state.copyWith(isLoading: false));
    });
  }
}
