import 'package:json_annotation/json_annotation.dart';

enum UserType {
  @JsonValue('학생')
  student,
  @JsonValue('일반인')
  other,
}
