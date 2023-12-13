import 'package:json_annotation/json_annotation.dart';

enum UserGenderType {
  @JsonValue('m')
  male,
  @JsonValue('f')
  female,
}
