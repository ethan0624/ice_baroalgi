import 'package:incheon_knowhow/domain/model/school_paging.dart';
import 'package:incheon_knowhow/domain/repository/school_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class FindSchool {
  final SchoolRepository repository;
  const FindSchool({required this.repository});

  Future<Result<SchoolPaging, Exception>> call({
    int? page,
    int? size,
    String? keyword,
  }) {
    return repository.findSchool(page: page, size: size, keyword: keyword);
  }
}
