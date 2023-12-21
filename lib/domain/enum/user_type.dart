import 'package:json_annotation/json_annotation.dart';

enum UserType {
  @JsonValue('학생')
  student,
  @JsonValue('일반인')
  other,
}

extension UserTypeExension on UserType {
  String get value {
    switch (this) {
      case UserType.student:
        return '1';
      case UserType.other:
        return '2';
    }
  }
}
