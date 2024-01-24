part of 'update_phone_bloc.dart';

sealed class UpdatePhoneEvent extends Equatable {
  const UpdatePhoneEvent();

  const factory UpdatePhoneEvent.save(String phoneNumber) = UpdatePhoneOnSave;

  @override
  List<Object> get props => [];
}

class UpdatePhoneOnSave extends UpdatePhoneEvent {
  final String phoneNumber;
  const UpdatePhoneOnSave(this.phoneNumber);
}
