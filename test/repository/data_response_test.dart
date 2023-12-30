// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:incheon_knowhow/core/extension/extension.dart';
// import 'package:incheon_knowhow/data/datasource/api_client.dart';
// import 'package:incheon_knowhow/data/repository/auth_repository_impl.dart';
// import 'package:incheon_knowhow/data/response/data_response.dart';
// import 'package:incheon_knowhow/domain/model/token.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'data_response_test.mocks.dart';

// @GenerateMocks([ApiClient])
// void main() {
//   group('data response test', () {
//     debugPrint('data response');
//     const successJson =
//         '{"result": 1, "message": "success", "data": {"accessToken": "123456", "refreshToken": "abcdef"}}';
//     const failJson = '{"result": 99, "message": "fail"}';
//     test('get token success test', () async {
//       final mockApiClient = MockApiClient();
//       final mockRepository = AuthRepositoryImpl(apiClient: mockApiClient);

//       when(mockApiClient
//               .login({'email': 'test@test.co.kr', 'password': '11111'}))
//           .thenAnswer((_) async {
//         final json = jsonDecode(successJson);
//         return DataResponse.fromJson(
//             json, (json) => Token.fromJson(json as Map<String, dynamic>));
//       });

//       final res = await mockRepository.getToken(
//           email: 'test@test.co.kr', password: '11111');

//       expect(res.isSuccess(), true, reason: '응답이 일치 하지 않음');
//       expect(res.tryGetSuccess()?.accessToken, '123456',
//           reason: '토큰값이 일치하지 않음');
//     });

//     test('get token fail test', () async {
//       final mockApiClient = MockApiClient();
//       final mockRepository = AuthRepositoryImpl(apiClient: mockApiClient);

//       when(mockApiClient
//               .login({'email': 'test@test.co.kr', 'password': '11111'}))
//           .thenAnswer((_) async {
//         final json = jsonDecode(failJson);
//         return DataResponse.fromJson(
//             json, (json) => Token.fromJson(json as Map<String, dynamic>));
//       });

//       final res = await mockRepository.getToken(
//           email: 'test@test.co.kr', password: '11111');

//       expect(res.isError(), true, reason: '응답이 일치 하지 않음');
//       expect(res.tryGetError()?.message, 'fail', reason: '오류 메세지 일치하지 않음');
//     });
//   });
// }
