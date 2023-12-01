import 'package:dio/dio.dart';

extension ExceptionExtension on Exception {
  String get message => toString().replaceFirst('Exception: ', '');
}

extension DioExceptionExtension on DioException {
  bool get isTimeout => [
        DioExceptionType.connectionTimeout,
        DioExceptionType.connectionError
      ].contains(type);
}
