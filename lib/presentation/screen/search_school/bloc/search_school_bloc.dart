import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'search_school_event.dart';
part 'search_school_state.dart';

class SearchSchoolBloc
    extends BaseSideEffectBloc<SearchSchoolEvent, SearchSchoolState> {
  SearchSchoolBloc() : super(const SearchSchoolState()) {
    on<SearchSchoolEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
