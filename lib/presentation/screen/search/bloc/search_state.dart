part of 'search_bloc.dart';

class SearchState extends BaseState {
  final List<Course> searchCourses;
  final List<Spot> searchSpots;
  final List<RelateResult> relateResults;

  const SearchState({
    super.isLoading,
    this.searchCourses = const [],
    this.searchSpots = const [],
    this.relateResults = const [],
  });

  copyWith({
    bool? isLoading,
    List<Course>? searchCourses,
    List<Spot>? searchSpots,
    List<RelateResult>? relateResults,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      searchCourses: searchCourses ?? this.searchCourses,
      searchSpots: searchSpots ?? this.searchSpots,
      relateResults: relateResults ?? this.relateResults,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        searchCourses,
        searchSpots,
        relateResults,
      ];
}
