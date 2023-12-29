import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/business_info.dart';
import 'package:incheon_knowhow/domain/repository/etc_repository.dart';

class GetBusinessInfo {
  final EtcRepository repository;
  const GetBusinessInfo({required this.repository});

  Future<Result<BusinessInfo, Exception>> call() {
    return repository.getBusinessInfo();
  }
}
