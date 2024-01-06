import 'package:json_annotation/json_annotation.dart';

part 'qna.g.dart';

@JsonSerializable()
class Qna {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'qustionTitle')
  final String qustionTitle;
  @JsonKey(name: 'question')
  final String questionContent;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'state')
  final bool isAnswer;
  @JsonKey(name: 'answerTitle')
  final String? answerTitle;
  @JsonKey(name: 'answer')
  final String? answerContent;
  @JsonKey(name: 'fileUrl')
  final List<String>? images;

  const Qna({
    required this.id,
    required this.qustionTitle,
    required this.questionContent,
    required this.createdAt,
    required this.updatedAt,
    required this.isAnswer,
    this.answerTitle,
    this.answerContent,
    this.images,
  });

  factory Qna.fromJson(Map<String, dynamic> json) => _$QnaFromJson(json);

  Map<String, dynamic> toJson() => _$QnaToJson(this);
}
