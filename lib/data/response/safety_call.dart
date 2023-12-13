import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/data/response/data_response.dart';
import 'package:multiple_result/multiple_result.dart';

Future<Result<DataResponse<T>, Exception>> safetyCall<T>(
    Future<DataResponse<T>> call) async {
  try {
    final response = await call;
    if (response.isSuccess) {
      return Success(response);
    } else {
      return Error(Exception(response.message));
    }
  } catch (e, s) {
    if (!isRelease) {
      debugPrint('>>>>>>> safety call error : $e // $s');
    }

    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.cancel:
          return const Result.error(NetworkException());
        case DioExceptionType.badResponse:
          try {
            final errorMessage = e.response?.data['message'] ?? e.message;
            return Result.error(Exception(errorMessage));
          } catch (error) {
            return Result.error(Exception(error));
          }
        case DioExceptionType.unknown:
          if (e.error is SocketException) {
            return Result.error(Exception('서비스 접속에 실패 하였습니다\n잠시 후 다시 시도해주세요'));
          }
          return Result.error(Exception(e.message));
        default:
          return Result.error(Exception(e.message));
      }
    }
    return const Result.error(NetworkException());
  }
}

class NetworkException implements Exception {
  const NetworkException();

  String get message => '네트워크 연결상태가 불안정합니다\n네트워크를 확인해주세요';
}
