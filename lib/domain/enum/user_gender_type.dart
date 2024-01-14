import 'package:easy_localization/easy_localization.dart';
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
        return '남자'.tr();
      case UserGenderType.female:
        return '여자'.tr();
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
