import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/string_extension.dart';
import 'package:incheon_knowhow/core/injection.dart';
import 'package:incheon_knowhow/core/provider/auth_provider.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/login/bloc/login_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/password_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/underline_text_button.dart';

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
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  _onLoginPressed() {
    _onResult();

    // if (!_emailTextController.text.isValidEmail()) {
    //   context.showAlert(title: '입력오류', message: '이메일을 정확하게 입력해주세요');
    //   return;
    // }

    // if (!_passwordTextController.text.isValidPassword()) {
    //   context.showAlert(title: '입력오류', message: '비밀번호를 정확하게 입력해주세요');
    //   return;
    // }

    // FocusManager.instance.primaryFocus?.unfocus();

    // todo
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
      getIt<AuthProvider>().loggedIn(user: User.tester());
      widget.onResult?.call(true);
      return;
    }

    context.router.pushNamed('/main');
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
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
                padding: const EdgeInsets.all(defaultMarginValue),
                children: [
                  Text(
                    '서비스 이용을 위해\n로그인해주세요.',
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    '아이디',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  AppTextFormField(
                    controller: _emailTextController,
                    hintText: '이메일 주소 입력',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onSubmitted: () {
                      final value = _emailTextController.text;
                      if (value.isNotEmpty && value.isValidEmail()) {
                        _passwordFocusNode.requestFocus();
                      }
                    },
                  ),
                  const SizedBox(height: defaultMarginValue),
                  Text(
                    '비밀번호',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  PasswordFormField(
                    controller: _passwordTextController,
                    focusNode: _passwordFocusNode,
                    onSubmitted: _onLoginPressed,
                  ),
                  AppButton(
                    margin: const EdgeInsets.symmetric(
                        vertical: defaultMarginValue),
                    text: '로그인',
                    textBold: true,
                    onPressed: _onLoginPressed,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: UnderlineTextButton(
                      text: '아이디 찾기',
                      margin: EdgeInsets.zero,
                      onPressed: _onFindIdPressed,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: UnderlineTextButton(
                      text: '비밀번호 재설정',
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      onPressed: _onFindPasswordPressed,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 35,
              left: 24,
              right: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      '회원이 아니신가요?',
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  AppButton(
                    text: '회원가입',
                    textStyle: context.textTheme.bodyMedium,
                    textColor: Colors.black,
                    background: Colors.white,
                    borderColor: AppColor.secondary,
                    onPressed: _onJoinPressed,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
