part of 'search_school_bloc.dart';

sealed class SearchSchoolEvent extends Equatable {
  const SearchSchoolEvent();

  const factory SearchSchoolEvent.search(String keyword) = SearchSchoolOnSearch;

  @override
  List<Object> get props => [];
}

class SearchSchoolOnSearch extends SearchSchoolEvent {
  final String keyword;
  const SearchSchoolOnSearch(this.keyword);
}
