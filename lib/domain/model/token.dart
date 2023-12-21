import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  @JsonKey(name: 'accessToken')
  final String accessToken;

  const Token({
    required this.accessToken,
  });

  factory Token.mock() {
    return const Token(
      accessToken: '1224',
    );
  }

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  String serialize() {
    return json.encode(toJson());
  }

  factory Token.deserialize(String json) {
    return Token.fromJson(jsonDecode(json));
  }
}
