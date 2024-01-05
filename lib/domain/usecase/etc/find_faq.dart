import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/faq_paging.dart';
import 'package:incheon_knowhow/domain/repository/etc_repository.dart';

class FindFaq {
  final EtcRepository repository;
  const FindFaq({required this.repository});

  Future<Result<FaqPaging, Exception>> call() {
    return repository.findFaq();
  }
}
