import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/model/relate_result.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:incheon_knowhow/domain/usecase/search/find_search.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends BaseSideEffectBloc<SearchEvent, SearchState> {
  final _findSearch = getIt<FindSearch>();
  SearchBloc() : super(const SearchState()) {
    on<SearchOnFind>((event, emit) async {
      final res = await _findSearch(event.keyword);
      final result = res.tryGetSuccess();

      print('>>> res : $res');
      print('>>> result : $result');

      final searchCourses = result?.courses ?? [];
      final searchSpots = result?.spots ?? [];

      List<RelateResult> relateResults = [];

      final relateCourses = searchCourses
          .map((e) => RelateResult(keyword: e.title, path: e.detailRoutePath));
      final relateSpots = searchSpots
          .map((e) => RelateResult(keyword: e.title, path: e.detailRoutePath));

      relateResults.addAll(relateCourses);
      relateResults.addAll(relateSpots);
      relateResults.sort((a, b) => a.keyword.compareTo(b.keyword));

      print('>>> searchCourses : $searchCourses');
      print('>>> searchSpots : $searchSpots');

      emit(state.copyWith(
        searchCourses: searchCourses,
        searchSpots: searchSpots,
        relateResults: relateResults.take(3).toList(),
      ));
    });
  }
}
