part of 'business_bloc.dart';

class BusinessState extends BaseState {
  final BusinessInfo? businessInfo;
  const BusinessState({
    super.isLoading,
    this.businessInfo,
  });

  copyWith({bool? isLoading, BusinessInfo? businessInfo}) {
    return BusinessState(
      isLoading: isLoading ?? this.isLoading,
      businessInfo: businessInfo ?? this.businessInfo,
    );
  }

  @override
  List<Object?> get props => [isLoading, businessInfo];
}
