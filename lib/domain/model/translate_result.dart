import 'package:json_annotation/json_annotation.dart';

part 'translate_result.g.dart';

@JsonSerializable()
class TranslateResult {
  @JsonKey(name: 'translatedText')
  final String text;

  const TranslateResult({
    required this.text,
  });

  factory TranslateResult.fromJson(Map<String, dynamic> json) =>
      _$TranslateResultFromJson(json);

  Map<String, dynamic> toJson() => _$TranslateResultToJson(this);
}
