part of 'spot_detail_bloc.dart';

class SpotDetailState extends BaseState {
  final Spot? spot;

  const SpotDetailState({
    super.isLoading,
    this.spot,
  });

  copyWith({
    bool? isLoading,
    Spot? spot,
  }) {
    return SpotDetailState(
      isLoading: isLoading ?? this.isLoading,
      spot: spot ?? this.spot,
    );
  }

  @override
  List<Object?> get props => [isLoading, spot];
}
