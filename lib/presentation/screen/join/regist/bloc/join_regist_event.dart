part of 'join_regist_bloc.dart';

sealed class JoinRegistEvent extends Equatable {
  const JoinRegistEvent();

  const factory JoinRegistEvent.changedEmail() = JoinRegistOnChangedEmail;
  const factory JoinRegistEvent.checkEmail(String email) =
      JoinRegistOnDuplicateEmailCheck;
  const factory JoinRegistEvent.regist({
    required String email,
    required String password,
    String? schoolName,
    String? schoolGrade,
    String? schoolClass,
  }) = JoinRegistOnSave;

  @override
  List<Object> get props => [];
}

class JoinRegistOnChangedEmail extends JoinRegistEvent {
  const JoinRegistOnChangedEmail();
}

class JoinRegistOnDuplicateEmailCheck extends JoinRegistEvent {
  final String email;
  const JoinRegistOnDuplicateEmailCheck(this.email);
}

class JoinRegistOnSave extends JoinRegistEvent {
  final String email;
  final String password;
  final String? schoolName;
  final String? schoolGrade;
  final String? schoolClass;
  const JoinRegistOnSave({
    required this.email,
    required this.password,
    this.schoolName,
    this.schoolGrade,
    this.schoolClass,
  });
}
