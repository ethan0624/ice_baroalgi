import 'package:incheon_knowhow/domain/model/school_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school_response.g.dart';

@JsonSerializable()
class SchoolResponse {
  @JsonKey(name: 'schoolInfo')
  final List<SchoolInfo> infos;

  const SchoolResponse({
    required this.infos,
  });

  factory SchoolResponse.fromJson(Map<String, dynamic> json) =>
      _$SchoolResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolResponseToJson(this);
}
