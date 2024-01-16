// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:iamport_flutter/Iamport_certification.dart';
import 'package:iamport_flutter/model/certification_data.dart';
import 'package:incheon_knowhow/config/app_config.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/screen/certification/certification_result.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';

@RoutePage<CertificationResult>()
class CertificationScreen extends StatefulWidget {
  const CertificationScreen({super.key});

  @override
  State<CertificationScreen> createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  final dio = Dio();
  String _accessToken = '';

  _getAccessToken() async {
    try {
      final res =
          await dio.post('${AppConfig.iamportApiUrl}/users/getToken', data: {
        'imp_key': AppConfig.iamportApiKey,
        'imp_secret': AppConfig.iamportApiSecret,
      });
      _accessToken = res.data['response']['access_token'];
    } catch (e) {}
  }

  _getCerificationResult(String uid) async {
    if (_accessToken.isEmpty) {
      context
          .showAlert(title: '본인인증 실패', message: '본인인인증을 실패하였습니다')
          .then((value) {
        context.router.pop();
      });
      return;
    }
    try {
      final res = await dio.get(
          '${AppConfig.iamportApiUrl}/certifications/$uid',
          options: Options(headers: {'Authorization': _accessToken}));
      final data = res.data['response'];
      final ci = data['unique_key'] as String? ?? '';
      final name = data['name'] as String? ?? '';
      final gender = data['gender'] as String? ?? '';
      final birthday = data['birthday'] as String? ?? '';
      final phone = data['phone'] as String? ?? '';

      context.router.pop(
        CertificationResult(
          ci: ci,
          di: ci,
          name: name,
          phoneNumber: phone,
          birthDay: birthday,
          gender: gender == 'male'
              ? CertificationResultGender.male
              : CertificationResultGender.female,
        ),
      );
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();

    _getAccessToken();
  }

  @override
  Widget build(BuildContext context) {
    return IamportCertification(
        appBar: AppSubAppBar(text: '본인인증'.tr()),
        initialChild: Center(
          child: Text(
            '잠시만 기다려주세요'.tr(),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        userCode: AppConfig.iamportUserCode,
        data: CertificationData(
          merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}',
          company: AppConfig.iamportCompany,
        ),
        callback: (result) {
          if (result['success'] == false) {
            context.router.pop();
          } else {
            final uid = result['imp_uid'];
            _getCerificationResult(uid);
          }
        });
  }
}
