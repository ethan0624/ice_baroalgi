import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/form/bloc/reseet_pw_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';

@RoutePage()
class ResetPwFormScreen extends StatefulWidget {
  const ResetPwFormScreen({super.key});

  @override
  State<ResetPwFormScreen> createState() => _ResetPwFormScreenState();
}

class _ResetPwFormScreenState extends State<ResetPwFormScreen> {
  _onCertificationPressed() {
    context.router.pushNamed('/resetPw/certification');
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<ReseetPwBloc, ReseetPwBloc, ReseetPwState>(
      appBar: AppSubAppBar(text: '비밀번호 재설정'),
      create: (_) => ReseetPwBloc(),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.all(defaultMarginValue),
          children: [
            const AppTitleText(
              text: '회원가입 시 등록한 이름과 \n이메일 입력 시 인증메일을 발송드립니다',
            ),
            const SizedBox(height: 50),
            Text(
              '이름',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const AppTextFormField(
              hintText: '이름을 입력하세요',
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: defaultMarginValue),
            Text(
              '이메일',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const AppTextFormField(
              hintText: '이메일 주소 입력',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: defaultMarginValue),
            AppButton(
              text: '인증번호 받기',
              onPressed: _onCertificationPressed,
            ),
          ],
        );
      },
    );
  }
}
