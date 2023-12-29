part of 'business_bloc.dart';

sealed class BusinessEvent extends Equatable {
  const BusinessEvent();

  const factory BusinessEvent.initial() = BusinessOnInitial;

  @override
  List<Object> get props => [];
}

class BusinessOnInitial extends BusinessEvent {
  const BusinessOnInitial();
}
