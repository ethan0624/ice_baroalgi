import 'package:json_annotation/json_annotation.dart';

part 'certification_code.g.dart';

@JsonSerializable()
class CertificationCode {
  @JsonKey(name: 'code')
  final String code;

  const CertificationCode({
    required this.code,
  });

  factory CertificationCode.fromJson(Map<String, dynamic> json) =>
      _$CertificationCodeFromJson(json);

  Map<String, dynamic> toJson() => _$CertificationCodeToJson(this);
}
