import 'package:equatable/equatable.dart';

class RecentKeyword extends Equatable {
  final String keyword;

  const RecentKeyword({
    required this.keyword,
  });

  @override
  List<Object> get props => [keyword];
}
