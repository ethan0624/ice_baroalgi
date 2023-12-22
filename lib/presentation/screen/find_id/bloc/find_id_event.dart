part of 'find_id_bloc.dart';

sealed class FindIdEvent extends Equatable {
  const FindIdEvent();

  const factory FindIdEvent.request({
    required String name,
    required String birth,
    required String phone,
  }) = FindIdOnRequest;

  @override
  List<Object> get props => [];
}

class FindIdOnRequest extends FindIdEvent {
  final String name;
  final String birth;
  final String phone;
  const FindIdOnRequest(
      {required this.name, required this.birth, required this.phone});
}
