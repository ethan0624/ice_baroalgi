import 'package:json_annotation/json_annotation.dart';
import 'package:incheon_knowhow/domain/model/translate_result.dart';

part 'papago_translate_response.g.dart';

@JsonSerializable()
class PapagoTranslateResponse {
  @JsonKey(name: 'result')
  final TranslateResult result;

  const PapagoTranslateResponse({
    required this.result,
  });

  factory PapagoTranslateResponse.fromJson(Map<String, dynamic> json) =>
      _$PapagoTranslateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PapagoTranslateResponseToJson(this);
}
