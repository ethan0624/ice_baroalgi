import 'package:json_annotation/json_annotation.dart';
import 'package:incheon_knowhow/data/response/papago_translate_response.dart';

part 'papago_response.g.dart';

@JsonSerializable()
class PapagoResponse {
  @JsonKey(name: 'message')
  final PapagoTranslateResponse message;

  const PapagoResponse({
    required this.message,
  });

  factory PapagoResponse.fromJson(Map<String, dynamic> json) =>
      _$PapagoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PapagoResponseToJson(this);
}
