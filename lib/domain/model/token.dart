import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  @JsonKey(name: 'accessToken')
  final String accessToken;
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  const Token({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Token.mock() {
    return const Token(
      accessToken: '1224',
      refreshToken: '4333',
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
