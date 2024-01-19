part of 'search_bloc.dart';

class SearchState extends BaseState {
  final List<RecentKeyword> recentKeywords;
  final List<Course> searchCourses;
  final List<Spot> searchSpots;
  final List<RelateResult> relateResults;

  const SearchState({
    super.isLoading,
    this.recentKeywords = const [],
    this.searchCourses = const [],
    this.searchSpots = const [],
    this.relateResults = const [],
  });

  copyWith({
    bool? isLoading,
    List<RecentKeyword>? recentKeywords,
    List<Course>? searchCourses,
    List<Spot>? searchSpots,
    List<RelateResult>? relateResults,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      recentKeywords: recentKeywords ?? this.recentKeywords,
      searchCourses: searchCourses ?? this.searchCourses,
      searchSpots: searchSpots ?? this.searchSpots,
      relateResults: relateResults ?? this.relateResults,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        recentKeywords,
        searchCourses,
        searchSpots,
        relateResults,
      ];
}
