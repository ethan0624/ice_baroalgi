import 'package:incheon_knowhow/domain/model/school.dart';

class SchoolPaging {
  final int totalCount;
  final int totalPage;
  final int page;
  final List<School> rows;

  const SchoolPaging({
    required this.totalCount,
    required this.totalPage,
    required this.page,
    required this.rows,
  });
}
