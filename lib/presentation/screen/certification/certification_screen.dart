import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:incheon_knowhow/presentation/screen/certification/certification_result.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';

@RoutePage<CertificationResult>()
class CertificationScreen extends StatelessWidget {
  const CertificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppSubAppBar(text: '본인인증'),
      child: Center(
        child: TextButton(
          onPressed: () {
            context.router.pop(
              const CertificationResult(
                  ci: 'ci',
                  di: 'di',
                  name: 'name',
                  phoneNumber: 'phoneNumber',
                  birthDay: 'birthDay',
                  gender: CertificationResultGender.male),
            );
          },
          child: const Text('인증성공처리'),
        ),
      ),
    );
    // return IamportCertification(
    //     appBar: AppSubAppBar(text: '본인인증'),
    //     initialChild: const Center(
    //       child: Text(
    //         '잠시만 기다려주세요...',
    //         style: TextStyle(fontSize: 20),
    //       ),
    //     ),
    //     userCode: 'iamport',
    //     data: CertificationData(
    //       merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}',
    //       company: '아임포트',
    //       // carrier: 'SKT', // 통신사
    //       // name: '윤훈희',
    //       // phone: '01012341234',
    //     ),
    //     callback: (result) {
    //       print('>>>>> result : $result');
    //       // todo;
    //     });
  }
}
