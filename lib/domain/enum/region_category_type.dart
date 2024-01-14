import 'package:easy_localization/easy_localization.dart';

enum RegionCategoryType {
  all(value: 0, label: '전체'),
  category1(value: 1, label: '강화군'),
  category2(value: 2, label: '옹진군'),
  category3(value: 3, label: '중구/동구/미추홀구'),
  category4(value: 4, label: '남동구/연수구'),
  category5(value: 5, label: '부평구/계양구/서구');

  final String label;
  final int value;

  const RegionCategoryType({
    required this.value,
    required this.label,
  });
}

extension RegionCategoryTypeExtension on RegionCategoryType {
  String get title {
    return label.tr();
  }
}
