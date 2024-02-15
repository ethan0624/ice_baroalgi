import 'package:incheon_knowhow/domain/model/translate_result.dart';
import 'package:incheon_knowhow/domain/repository/etc_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class GetTranslateText {
  final EtcRepository repository;
  const GetTranslateText({required this.repository});

  Future<Result<TranslateResult, Exception>> call({
    required String targetLocale,
    required String text,
  }) {
    return repository.translate(targetLocale: targetLocale, text: text);
  }
}
