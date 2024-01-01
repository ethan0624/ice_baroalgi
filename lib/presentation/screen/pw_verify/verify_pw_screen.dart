import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/string_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/pw_verify/bloc/verify_pw_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/password_form_field.dart';

@RoutePage<bool>()
class VerifyPwScreen extends StatefulWidget {
  const VerifyPwScreen({super.key});

  @override
  State<VerifyPwScreen> createState() => _VerifyPwScreenState();
}

class _VerifyPwScreenState extends State<VerifyPwScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _passwordTextController;

  _onVerifyPressed() {
    if (_passwordTextController.text.isEmpty) {
      context.showAlert(title: '비밀번호 확인', message: '현재 비밀번호를 입력해주세요');
      return;
    }

    if (!_passwordTextController.text.isValidPassword()) {
      context.showAlert(title: '비밀번호 확인', message: '비밀번호는 영문, 숫자를 포함한 8자리입니다');
      return;
    }

    final bloc = _scaffoldKey.currentContext?.read<VerifyPwBloc>();
    if (bloc == null) return;

    bloc.add(VerifyPwEvent.confrim(_passwordTextController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<VerifyPwBloc, VerifyPwBloc, VerifyPwState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '비밀번호 재설정'),
      create: (context) => VerifyPwBloc(),
      effectChanged: (context, effect) {
        if (effect is SuccessEffect) {
          context.router.pop(true);
          return;
        }
      },
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          children: [
            const AppTitleText(text: '현재 비밀번호를 입력해주세요'),
            const SizedBox(height: 50),
            Text(
              '비밀번호',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            PasswordFormField(
              autoFocus: true,
              onCreated: (controller) {
                _passwordTextController = controller;
              },
            ),
            const SizedBox(height: 100),
            AppButton(
              text: '다음',
              onPressed: _onVerifyPressed,
            ),
          ],
        );
      },
    );
  }
}
