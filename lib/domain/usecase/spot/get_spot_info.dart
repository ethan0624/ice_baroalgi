import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:incheon_knowhow/domain/repository/spot_repository.dart';

class GetSpotInfo {
  final SpotRepository repository;
  const GetSpotInfo({required this.repository});

  Future<Result<Spot, Exception>> call(int id) async {
    return repository.getSpotInfo(id);
  }
}
