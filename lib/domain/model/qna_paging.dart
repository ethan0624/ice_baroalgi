import 'package:incheon_knowhow/domain/model/qna.dart';
import 'package:json_annotation/json_annotation.dart';

part 'qna_paging.g.dart';

@JsonSerializable()
class QnaPaging {
  @JsonKey(name: 'qnas')
  final List<Qna> rows;
  @JsonKey(name: 'total')
  final int total;

  const QnaPaging({
    required this.rows,
    required this.total,
  });

  factory QnaPaging.fromJson(Map<String, dynamic> json) =>
      _$QnaPagingFromJson(json);

  Map<String, dynamic> toJson() => _$QnaPagingToJson(this);
}
