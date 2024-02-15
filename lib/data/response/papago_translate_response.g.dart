// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'papago_translate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PapagoTranslateResponse _$PapagoTranslateResponseFromJson(
        Map<String, dynamic> json) =>
    PapagoTranslateResponse(
      result: TranslateResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PapagoTranslateResponseToJson(
        PapagoTranslateResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
