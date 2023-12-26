import 'package:incheon_knowhow/domain/model/school_paging.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SchoolRepository {
  Future<Result<SchoolPaging, Exception>> findSchool({
    int? page,
    int? size,
    String? keyword,
  });
}
