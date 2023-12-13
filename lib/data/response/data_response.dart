import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataResponse<T> {
  @JsonKey(name: 'result')
  final int result;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final List<T>? data;

  const DataResponse({
    required this.result,
    required this.message,
    this.data,
  });

  factory DataResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$DataResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$DataResponseToJson(this, toJsonT);
}

extension DataResponseExtension on DataResponse {
  bool get isSuccess => result == 1;
}
