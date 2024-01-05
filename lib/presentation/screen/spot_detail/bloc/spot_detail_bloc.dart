import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:incheon_knowhow/domain/usecase/spot/get_spot_info.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'spot_detail_event.dart';
part 'spot_detail_state.dart';

class SpotDetailBloc
    extends BaseSideEffectBloc<SpotDetailEvent, SpotDetailState> {
  final _getSpotInfo = getIt<GetSpotInfo>();
  final int spotId;
  SpotDetailBloc({required this.spotId}) : super(const SpotDetailState()) {
    on<SpotDetailOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _getSpotInfo(spotId);

      emit(state.copyWith(
        isLoading: false,
        spot: res.tryGetSuccess(),
      ));
    });
  }
}
