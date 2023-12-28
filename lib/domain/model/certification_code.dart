import 'package:json_annotation/json_annotation.dart';

part 'certification_code.g.dart';

@JsonSerializable()
class CertificationCode {
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'id')
  final int userId;

  // 인증번호 요청 성공시 요청한 정보를 담아서 전달함(재전송시 사용)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? email;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? name;

  const CertificationCode({
    required this.code,
    required this.userId,
    this.email,
    this.name,
  });

  copyWith({
    String? code,
    String? email,
    String? name,
  }) {
    return CertificationCode(
      code: code ?? this.code,
      userId: userId,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  factory CertificationCode.fromJson(Map<String, dynamic> json) =>
      _$CertificationCodeFromJson(json);

  Map<String, dynamic> toJson() => _$CertificationCodeToJson(this);
}

extension CertificationCodeExtension on CertificationCode {
  bool get canResend =>
      email != null &&
      email?.isNotEmpty == true &&
      name != null &&
      name?.isNotEmpty == true;
}
