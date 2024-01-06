import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/qna_paging.dart';
import 'package:incheon_knowhow/domain/repository/etc_repository.dart';

class FindQna {
  final EtcRepository repository;
  const FindQna({required this.repository});

  Future<Result<QnaPaging, Exception>> call() {
    return repository.findQna();
  }
}
