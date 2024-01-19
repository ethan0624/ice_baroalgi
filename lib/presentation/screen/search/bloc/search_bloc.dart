import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/model/recent_keyword.dart';
import 'package:incheon_knowhow/domain/model/relate_result.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:incheon_knowhow/domain/usecase/search/clear_recent_keyword.dart';
import 'package:incheon_knowhow/domain/usecase/search/delete_recent_keyword.dart';
import 'package:incheon_knowhow/domain/usecase/search/find_recent_keyword.dart';
import 'package:incheon_knowhow/domain/usecase/search/find_search.dart';
import 'package:incheon_knowhow/domain/usecase/search/update_recent_keyword.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends BaseSideEffectBloc<SearchEvent, SearchState> {
  final _findRecentKeyword = getIt<FindRecentKeyword>();
  final _findSearch = getIt<FindSearch>();
  final _updateRecentKeyword = getIt<UpdateRecentKeyword>();
  final _deleteRecentKeyword = getIt<DeleteRecentKeyword>();
  final _clearRecentKeyword = getIt<ClearRecentKeyword>();

  final List<RecentKeyword> _recentKeywords = [];

  SearchBloc() : super(const SearchState()) {
    on<SearchOnInitial>((event, emit) async {
      final res = await _findRecentKeyword();

      _recentKeywords.clear();
      _recentKeywords.addAll(
          (res.tryGetSuccess() ?? []).map((e) => RecentKeyword(keyword: e)));

      emit(state.copyWith(recentKeywords: _recentKeywords));
    });

    on<SearchOnFind>((event, emit) async {
      final keyword = event.keyword;
      final res = await _findSearch(keyword);
      final result = res.tryGetSuccess();

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

      final recentKeyword = RecentKeyword(keyword: keyword);
      if (!_recentKeywords.contains(recentKeyword)) {
        _recentKeywords.add(recentKeyword);
        await _updateRecentKeyword(
            _recentKeywords.map((e) => e.keyword).toList());
      }

      emit(state.copyWith(
        searchCourses: searchCourses,
        searchSpots: searchSpots,
        relateResults: relateResults.take(3).toList(),
        recentKeywords: [..._recentKeywords],
      ));
    });

    on<SearchOnDeleteRecentKeyword>((event, emit) async {
      final res = await _deleteRecentKeyword(event.keyword);

      _recentKeywords.clear();
      _recentKeywords.addAll(
          (res.tryGetSuccess() ?? []).map((e) => RecentKeyword(keyword: e)));

      emit(state.copyWith(recentKeywords: [..._recentKeywords]));
    });

    on<SearchOnClearRecentKeyword>((event, emit) async {
      await _clearRecentKeyword();
      _recentKeywords.clear();
      emit(state.copyWith(
        recentKeywords: [],
      ));
    });
  }
}
