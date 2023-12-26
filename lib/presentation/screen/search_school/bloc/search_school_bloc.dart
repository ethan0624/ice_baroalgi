import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/school.dart';
import 'package:incheon_knowhow/domain/usecase/school/find_school.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'search_school_event.dart';
part 'search_school_state.dart';

class SearchSchoolBloc
    extends BaseSideEffectBloc<SearchSchoolEvent, SearchSchoolState> {
  final _findSchool = getIt<FindSchool>();
  SearchSchoolBloc() : super(const SearchSchoolState()) {
    on<SearchSchoolOnSearch>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _findSchool(page: 1, keyword: event.keyword);

      print('>>> res : $res');
      emit(state.copyWith(
        isLoading: false,
      ));
    });
  }
}
