import 'package:json_annotation/json_annotation.dart';

enum UserGenderType {
  @JsonValue('m')
  male,
  @JsonValue('f')
  female,
}

extension UserGenderTypeExtension on UserGenderType {
  String get title {
    switch (this) {
      case UserGenderType.male:
        return '남자';
      case UserGenderType.female:
        return '여자';
    }
  }

  String get value {
    switch (this) {
      case UserGenderType.male:
        return 'm';
      case UserGenderType.female:
        return 'f';
    }
  }
}
