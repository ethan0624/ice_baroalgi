// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessInfo _$BusinessInfoFromJson(Map<String, dynamic> json) => BusinessInfo(
      businessName: json['businessName'] as String,
      businessNumber: json['corporateRegistrationNumber'] as String,
      ceoName: json['representative'] as String,
      address: json['address'] as String?,
      email: json['email'] as String?,
      customerCenterPhoneNumber: json['customerCenter'] as String?,
      privacyInfoManager: json['privacyInforLeader'] as String?,
    );

Map<String, dynamic> _$BusinessInfoToJson(BusinessInfo instance) =>
    <String, dynamic>{
      'businessName': instance.businessName,
      'corporateRegistrationNumber': instance.businessNumber,
      'representative': instance.ceoName,
      'address': instance.address,
      'email': instance.email,
      'customerCenter': instance.customerCenterPhoneNumber,
      'privacyInforLeader': instance.privacyInfoManager,
    };
