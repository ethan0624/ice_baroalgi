part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  const factory SearchEvent.search(String keyword) = SearchOnFind;

  @override
  List<Object> get props => [];
}

class SearchOnFind extends SearchEvent {
  final String keyword;
  const SearchOnFind(this.keyword);
}
