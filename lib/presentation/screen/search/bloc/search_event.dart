part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  const factory SearchEvent.initial() = SearchOnInitial;
  const factory SearchEvent.search(String keyword) = SearchOnFind;
  const factory SearchEvent.deleteRecentKeyword(String keyword) =
      SearchOnDeleteRecentKeyword;
  const factory SearchEvent.clearRecentKeyword() = SearchOnClearRecentKeyword;

  @override
  List<Object> get props => [];
}

class SearchOnInitial extends SearchEvent {
  const SearchOnInitial();
}

class SearchOnFind extends SearchEvent {
  final String keyword;
  const SearchOnFind(this.keyword);
}

class SearchOnDeleteRecentKeyword extends SearchEvent {
  final String keyword;
  const SearchOnDeleteRecentKeyword(this.keyword);
}

class SearchOnClearRecentKeyword extends SearchEvent {
  const SearchOnClearRecentKeyword();
}
