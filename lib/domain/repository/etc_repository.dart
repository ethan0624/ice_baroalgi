import 'package:incheon_knowhow/domain/model/business_info.dart';
import 'package:incheon_knowhow/domain/model/notice_paging.dart';
import 'package:incheon_knowhow/domain/model/push.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class EtcRepository {
  Future<Result<NoticePaging, Exception>> findNotice();

  Future<Result<BusinessInfo, Exception>> getBusinessInfo();

  Future<Result<List<Push>, Exception>> findPush();

  Future<Result<bool, Exception>> updatePush(int pushId);
}