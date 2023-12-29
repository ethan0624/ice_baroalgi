import 'package:incheon_knowhow/domain/model/notice.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notice_paging.g.dart';

@JsonSerializable()
class NoticePaging {
  @JsonKey(name: 'notices')
  final List<Notice> notices;
  @JsonKey(name: 'total')
  final int total;

  const NoticePaging({
    required this.notices,
    required this.total,
  });

  factory NoticePaging.fromJson(Map<String, dynamic> json) =>
      _$NoticePagingFromJson(json);

  Map<String, dynamic> toJson() => _$NoticePagingToJson(this);
}
