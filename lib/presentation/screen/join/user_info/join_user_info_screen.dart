import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_layout.dart';
import 'package:incheon_knowhow/presentation/screen/certification/certification_result.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/route/app_router.dart';

@RoutePage()
class JoinUserInfoScreen extends StatefulWidget {
  final JoinData joinData;
  const JoinUserInfoScreen({super.key, required this.joinData});

  @override
  State<JoinUserInfoScreen> createState() => _JoinUserInfoScreenState();
}

class _JoinUserInfoScreenState extends State<JoinUserInfoScreen> {
  _onCertificationPressed() async {
    final ret =
        await context.router.pushNamed<CertificationResult>('/certification');
    if (ret == null) return;

    context.router.push(JoinRegistRoute(joinData: widget.joinData));
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppSubAppBar(text: '회원가입'),
      child: ListView(
        padding: const EdgeInsets.all(26),
        children: [
          Text(
            '보호자 휴대폰으로 인증하기\n(문구변경예정)',
            style: context.textTheme.titleSmall,
          ),
          Text(
            '* 가입자 정보를 입력해주세요.',
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: 56),
          Text(
            '이름',
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const AppTextFormField(
            hintText: '이름을 입력하세요',
          ),
          const SizedBox(height: 26),
          Text(
            '생년월일',
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const AppTextFormField(
            hintText: 'YYYY / MM / DD',
          ),
          const SizedBox(height: 26),
          Text(
            '성별',
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 26),
          Text(
            '휴대폰 번호',
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          const AppTextFormField(
            hintText: '가입자의 휴대폰 번호를 입력하세요',
          ),
          const SizedBox(height: 26),
          Text(
            '보호자 인증',
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          AppButton(
            margin: const EdgeInsets.symmetric(vertical: 14),
            text: '보호자 휴대폰 인증하기',
            textBold: true,
            onPressed: _onCertificationPressed,
          ),
        ],
      ),
    );
  }
}
