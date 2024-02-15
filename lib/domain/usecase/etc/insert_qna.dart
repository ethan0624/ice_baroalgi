import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:incheon_knowhow/domain/repository/etc_repository.dart';

class InsertQna {
  final EtcRepository repository;
  const InsertQna({required this.repository});

  Future<Result<bool, Exception>> call({
    required String title,
    required String question,
    List<File>? files,
  }) {
    return repository.saveQna(title, question, files ?? []);
  }
}
