part of 'update_school_bloc.dart';

sealed class UpdateSchoolEvent extends Equatable {
  const UpdateSchoolEvent();

  const factory UpdateSchoolEvent.save({
    required String schoolName,
    required int schoolGrade,
    required int schoolClass,
  }) = UpdateSchoolOnSave;

  @override
  List<Object> get props => [];
}

class UpdateSchoolOnSave extends UpdateSchoolEvent {
  final String schoolName;
  final int schoolGrade;
  final int schoolClass;
  const UpdateSchoolOnSave({
    required this.schoolName,
    required this.schoolGrade,
    required this.schoolClass,
  });
}
