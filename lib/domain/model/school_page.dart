import 'package:json_annotation/json_annotation.dart';

part 'school_page.g.dart';

@JsonSerializable()
class SchoolPage {
  @JsonKey(name: 'list_total_count')
  final int totalCount;

  const SchoolPage({
    required this.totalCount,
  });

  factory SchoolPage.fromJson(Map<String, dynamic> json) =>
      _$SchoolPageFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolPageToJson(this);
}

extension SchoolPageExtension on SchoolPage {
  int get totalPage => (totalCount / 10).round();
}
