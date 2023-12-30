import 'package:equatable/equatable.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/domain/model/business_info.dart';
import 'package:incheon_knowhow/domain/usecase/etc/get_business_info.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc.dart';
import 'package:incheon_knowhow/presentation/base/base_state.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends BaseSideEffectBloc<BusinessEvent, BusinessState> {
  final _getBusinessInfo = getIt<GetBusinessInfo>();
  BusinessBloc() : super(const BusinessState()) {
    on<BusinessOnInitial>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final res = await _getBusinessInfo();

      emit(state.copyWith(
        isLoading: false,
        businessInfo: res.tryGetSuccess(),
      ));
    });
  }
}
