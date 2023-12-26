import 'package:json_annotation/json_annotation.dart';

part 'school.g.dart';

@JsonSerializable()
class School {
  @JsonKey(name: 'SCHUL_NM')
  final String name;
  @JsonKey(name: 'ENG_SCHUL_NM')
  final String engName;
  @JsonKey(name: 'JU_ORG_NM')
  final String organizationName;

  const School({
    required this.name,
    required this.engName,
    required this.organizationName,
  });

  factory School.fromJson(Map<String, dynamic> json) => _$SchoolFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolToJson(this);
}
