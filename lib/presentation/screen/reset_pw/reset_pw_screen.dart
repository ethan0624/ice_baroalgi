import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/bloc/reseet_pw_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/verfication_button.dart';

@RoutePage()
class ResetPwScreen extends StatefulWidget {
  const ResetPwScreen({super.key});

  @override
  State<ResetPwScreen> createState() => _ResetPwScreenState();
}

class _ResetPwScreenState extends State<ResetPwScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<ReseetPwBloc, ReseetPwBloc, ReseetPwState>(
      create: (_) => ReseetPwBloc(),
      appBar: AppSubAppBar(
        text: '비밀번호 재설정',
      ),
      builder: (context, bloc, state) {
        return Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '비밀번호가 생각나지 않으세요?',
                style: context.textTheme.titleSmall,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  '휴대폰 인증을 통해 비밀번호를 재설정 할 수 있어요',
                  style: context.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 26),
              VerificationButton(
                label: '휴대폰 인증하기',
                iconPath: 'assets/images/img_phone_off.png',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              VerificationButton(
                label: '이메일 인증하기',
                iconPath: 'assets/images/img_email_off.png',
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
