part of 'search_bloc.dart';

class SearchState extends BaseState {
  const SearchState({
    super.isLoading,
  });

  copyWith({
    bool? isLoading,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [isLoading];
}
