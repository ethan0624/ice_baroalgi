import 'package:json_annotation/json_annotation.dart';

part 'business_info.g.dart';

@JsonSerializable()
class BusinessInfo {
  @JsonKey(name: 'businessName')
  final String businessName;
  @JsonKey(name: 'corporateRegistrationNumber')
  final String businessNumber;
  @JsonKey(name: 'representative')
  final String ceoName;
  @JsonKey(name: 'address')
  final String? address;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'customerCenter')
  final String? customerCenterPhoneNumber;
  @JsonKey(name: 'privacyInforLeader')
  final String? privacyInfoManager;

  const BusinessInfo({
    required this.businessName,
    required this.businessNumber,
    required this.ceoName,
    this.address,
    this.email,
    this.customerCenterPhoneNumber,
    this.privacyInfoManager,
  });

  factory BusinessInfo.fromJson(Map<String, dynamic> json) =>
      _$BusinessInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessInfoToJson(this);
}
