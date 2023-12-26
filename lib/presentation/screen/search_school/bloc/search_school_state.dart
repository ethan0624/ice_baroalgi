part of 'search_school_bloc.dart';

class SearchSchoolState extends BaseState {
  final List<School> schools;
  const SearchSchoolState({
    super.isLoading,
    this.schools = const [],
  });

  copyWith({
    bool? isLoading,
    List<School>? schools,
  }) {
    return SearchSchoolState(
      isLoading: isLoading ?? this.isLoading,
      schools: schools ?? this.schools,
    );
  }

  @override
  List<Object> get props => [isLoading, schools];
}
