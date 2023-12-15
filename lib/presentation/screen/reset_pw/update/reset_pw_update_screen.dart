import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/update/bloc/reset_pw_update_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/icon_text.dart';
import 'package:incheon_knowhow/presentation/widget/password_form_field.dart';

@RoutePage()
class ResetPwUpdateScreen extends StatefulWidget {
  const ResetPwUpdateScreen({super.key});

  @override
  State<ResetPwUpdateScreen> createState() => _ResetPwUpdateScreenState();
}

class _ResetPwUpdateScreenState extends State<ResetPwUpdateScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _onUpdatePressed() {
    context.router.popUntil((route) {
      return !(route.data?.path.contains('resetPw') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<ResetPwUpdateBloc, ResetPwUpdateBloc,
        ResetPwUpdateState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '비밀번호 재설정'),
      create: (_) => ResetPwUpdateBloc(),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.all(defaultMarginValue),
          children: [
            const AppTitleText(
              text: '새로운 비밀번호를 입력해주세요',
            ),
            const SizedBox(height: 50),
            Text(
              '비밀번호',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const PasswordFormField(),
            const PasswordFormField(
              hint: '비밀번호 확인',
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
            IconText(
              icon: SvgPicture.asset(
                'assets/images/ic_close.svg',
                width: 20,
                height: 20,
                colorFilter:
                    const ColorFilter.mode(Colors.red, BlendMode.srcIn),
              ),
              label: '비밀번호와 비밀번호 확인이 일치하지 않습니다.',
            ),
            const SizedBox(height: defaultMarginValue),
            AppButton(
              text: '비밀번호 변경완료',
              onPressed: _onUpdatePressed,
            ),
          ],
        );
      },
    );
  }
}
