import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/notice_paging.dart';
import 'package:incheon_knowhow/domain/repository/etc_repository.dart';

class FindNotice {
  final EtcRepository repository;
  const FindNotice({required this.repository});

  Future<Result<NoticePaging, Exception>> call() {
    return repository.findNotice();
  }
}
