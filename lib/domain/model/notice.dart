import 'package:json_annotation/json_annotation.dart';

part 'notice.g.dart';

@JsonSerializable()
class Notice {
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'image')
  final List<String>? images;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const Notice({
    required this.title,
    this.content,
    this.images,
    this.createdAt,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}
