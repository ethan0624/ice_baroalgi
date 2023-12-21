import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

  const Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  static List<Category> mockTopics() {
    return const [
      Category(id: 1, name: '역사'),
      Category(id: 2, name: '맛집'),
      Category(id: 3, name: '아이랑'),
    ];
  }

  static List<Category> mockRegions() {
    return const [
      Category(id: 1, name: '강화군'),
      Category(id: 2, name: '옹진군'),
      Category(id: 3, name: '중구'),
      Category(id: 4, name: '동구'),
      Category(id: 5, name: '미추홀구'),
      Category(id: 7, name: '연수구'),
      Category(id: 8, name: '부평구'),
      Category(id: 9, name: '계양구'),
      Category(id: 10, name: '서구'),
    ];
  }

  static List<Category> mockRecommends() {
    return const [
      Category(id: 1, name: '강추코스'),
      Category(id: 2, name: '초등학생'),
      Category(id: 3, name: '중학생'),
      Category(id: 4, name: '고등학생'),
    ];
  }
}
