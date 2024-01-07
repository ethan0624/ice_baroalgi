import 'package:json_annotation/json_annotation.dart';

part 'faq.g.dart';

@JsonSerializable()
class Faq {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'fcategoryId')
  final int categoryId;
  @JsonKey(name: 'fcategoryName')
  final String categoryName;
  @JsonKey(name: 'question')
  final String question;
  @JsonKey(name: 'answer')
  final String answer;

  const Faq({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.question,
    required this.answer,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);

  Map<String, dynamic> toJson() => _$FaqToJson(this);
}
