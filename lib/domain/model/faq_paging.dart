import 'package:incheon_knowhow/domain/model/faq.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faq_paging.g.dart';

@JsonSerializable()
class FaqPaging {
  @JsonKey(name: 'fqas')
  final List<Faq> faqs;
  @JsonKey(name: 'total')
  final int total;

  const FaqPaging({
    required this.faqs,
    required this.total,
  });

  factory FaqPaging.fromJson(Map<String, dynamic> json) =>
      _$FaqPagingFromJson(json);

  Map<String, dynamic> toJson() => _$FaqPagingToJson(this);
}
