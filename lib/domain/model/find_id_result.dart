import 'package:json_annotation/json_annotation.dart';

part 'find_id_result.g.dart';

@JsonSerializable()
class FindIdResult {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'email')
  final String email;

  const FindIdResult({
    required this.name,
    required this.email,
  });

  factory FindIdResult.fromJson(Map<String, dynamic> json) =>
      _$FindIdResultFromJson(json);

  Map<String, dynamic> toJson() => _$FindIdResultToJson(this);
}
