import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:incheon_knowhow/presentation/screen/certification/certification_result.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/verfication_button.dart';
import 'package:incheon_knowhow/route/app_router.dart';

@RoutePage()
class JoinCertificationScreen extends StatefulWidget {
  final JoinData joinData;
  const JoinCertificationScreen({super.key, required this.joinData});

  @override
  State<JoinCertificationScreen> createState() =>
      _JoinCertificationScreenState();
}

class _JoinCertificationScreenState extends State<JoinCertificationScreen> {
  _onCertificationPressed() async {
    final ret =
        await context.router.pushNamed<CertificationResult>('/certification');
    if (ret == null) return;

    context.router.push(JoinRegistRoute(joinData: widget.joinData));
  }

  _onParentCertificationPressed() async {
    context.router.push(JoinUserInfoRoute(joinData: widget.joinData));
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppSubAppBar(text: '회원가입'),
      child: ListView(
        padding: const EdgeInsets.all(26),
        children: [
          Text(
            '본인인증을 진행해주세요.',
            style: context.textTheme.titleSmall,
          ),
          Text(
            '본인 휴대폰이 없는 경우\n보호자 휴대폰으로 인증하세요.',
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: 26),
          VerificationButton(
            label: '휴대폰 인증하기',
            iconPath: 'assets/images/img_phone_on.png',
            onPressed: _onCertificationPressed,
          ),
          const SizedBox(height: 14),
          VerificationButton(
            label: '보호자 휴대폰 인증하기',
            iconPath: 'assets/images/img_person_on.png',
            onPressed: _onParentCertificationPressed,
          ),
        ],
      ),
    );
  }
}
