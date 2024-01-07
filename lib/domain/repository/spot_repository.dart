import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';

abstract class SpotRepository {
  Future<Result<Spot, Exception>> getSpotInfo(int id);

  Future<Result<bool, Exception>> setSpotFlag(int id);
}
