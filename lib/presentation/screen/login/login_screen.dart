import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/login/bloc/login_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';
import 'package:incheon_knowhow/presentation/widget/password_form_field.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  final ValueChanged<bool>? onResult;
  const LoginScreen({
    super.key,
    this.onResult,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _idTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  _onLoginPressed() {
    // todo
    _onResult();
  }

  _onFindIdPressed() {
    context.router.pushNamed('/findId');
  }

  _onFindPasswordPressed() {
    context.router.pushNamed('/resetPw');
  }

  _onJoinPressed() async {
    // final ret =
    //     await context.router.pushNamed<CertificationResult>('/certification');
    context.router.pushNamed('/join');
  }

  _onResult() {
    if (widget.onResult != null) {
      getIt<AuthProvider>().loggedIn(user: const User(name: 'test'));
      widget.onResult?.call(true);
      return;
    }

    context.router.pushNamed('/main');
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<LoginBloc, LoginBloc, LoginState>(
      scaffoldKey: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      create: (_) => LoginBloc(),
      appBar: AppSubAppBar(
        text: '로그인',
      ),
      builder: (context, bloc, state) {
        return Stack(
          children: [
            Positioned.fill(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              child: ListView(
                padding: const EdgeInsets.all(26),
                children: [
                  Text(
                    '서비스 이용을 위해\n로그인해주세요.',
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 60),
                  Text(
                    '아이디',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  AppTextFormField(
                    controller: _idTextController,
                    hintText: '이메일 주소 입력',
                  ),
                  const SizedBox(height: 28),
                  Text(
                    '비밀번호',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  PasswordFormField(
                    controller: _passwordTextController,
                  ),
                  const SizedBox(height: 28),
                  AppButton(
                    text: '로그인',
                    textBold: true,
                    onPressed: _onLoginPressed,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 26,
              right: 26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton(text: '아이디 찾기', onPressed: _onFindIdPressed),
                  OutlineButton(
                      text: '비밀번호 재설정', onPressed: _onFindPasswordPressed),
                  OutlineButton(text: '회원가입', onPressed: _onJoinPressed),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
