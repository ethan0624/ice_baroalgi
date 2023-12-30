import 'package:json_annotation/json_annotation.dart';

part 'push.g.dart';

@JsonSerializable()
class Push {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String? content;
  @JsonKey(name: 'state')
  final bool isRead;
  @JsonKey(name: 'received_at')
  final String receivedDateString;

  const Push({
    required this.id,
    required this.title,
    required this.isRead,
    required this.receivedDateString,
    this.content,
  });

  factory Push.fromJson(Map<String, dynamic> json) => _$PushFromJson(json);

  Map<String, dynamic> toJson() => _$PushToJson(this);
}
