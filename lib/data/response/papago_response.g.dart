// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'papago_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PapagoResponse _$PapagoResponseFromJson(Map<String, dynamic> json) =>
    PapagoResponse(
      message: PapagoTranslateResponse.fromJson(
          json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PapagoResponseToJson(PapagoResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
