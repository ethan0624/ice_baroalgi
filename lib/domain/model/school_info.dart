import 'package:json_annotation/json_annotation.dart';
import 'package:incheon_knowhow/domain/model/school.dart';
import 'package:incheon_knowhow/domain/model/school_page.dart';

part 'school_info.g.dart';

@JsonSerializable()
class SchoolInfo {
  @JsonKey(name: 'head')
  final List<SchoolPage> pages;
  @JsonKey(name: 'row')
  final List<School> rows;

  const SchoolInfo({
    required this.pages,
    required this.rows,
  });

  factory SchoolInfo.fromJson(Map<String, dynamic> json) =>
      _$SchoolInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolInfoToJson(this);
}
