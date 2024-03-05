import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/string_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/login/bloc/login_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/password_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/underline_text_button.dart';
import 'package:provider/provider.dart';

@RoutePage<bool>()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailTextController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  late TextEditingController _passwordTextController;

  _onLoginPressed() {
    if (!_emailTextController.text.isValidEmail()) {
      context.showAlert(title: '입력오류'.tr(), message: '이메일을 정확하게 입력해주세요'.tr());
      return;
    }

    if (!_passwordTextController.text.isValidPassword()) {
      context.showAlert(title: '입력오류'.tr(), message: '비밀번호를 정확하게 입력해주세요'.tr());
      return;
    }

    final bloc = _scaffoldKey.currentContext?.read<LoginBloc>();
    if (bloc == null) return;

    FocusManager.instance.primaryFocus?.unfocus();

    bloc.add(LoginEvent.login(
      _emailTextController.text,
      _passwordTextController.text,
    ));
  }

  _onFindIdPressed() {
    context.router.pushNamed('/findId');
  }

  _onFindPasswordPressed() {
    context.router.pushNamed('/resetPw');
  }

  _onJoinPressed() async {
    context.router.pushNamed('/join');
  }

  _onClear() {
    FocusManager.instance.primaryFocus?.unfocus();
    _emailTextController.text = '';
    _passwordTextController.text = '';
  }

  _handlerEffect(BlocEffect effect) {
    if (effect is SuccessEffect) {
      context.router.pop(true);
      return;
    } else if (effect is ShowAlertMessageEffect) {
      // _onClear();
      return;
    }
  }

  _cancel() {
    FocusManager.instance.primaryFocus?.unfocus();
    context.router.pop(false);
  }

  @override
  void dispose() {
    _onClear();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<LoginBloc, LoginBloc, LoginState>(
      scaffoldKey: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppSubAppBar(
        text: '로그인'.tr(),
        onBackPressed: _cancel,
      ),
      create: (_) => LoginBloc(),
      effectChanged: (context, effect) {
        _handlerEffect(effect);
      },
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.all(defaultMarginValue),
          children: [
            Text(
              '서비스 이용을 위해 로그인해주세요'.tr(),
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: 50),
            Text(
              '아이디'.tr(),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            AppTextFormField(
              controller: _emailTextController,
              hintText: '이메일 주소 입력'.tr(),
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
              '비밀번호'.tr(),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            PasswordFormField(
              focusNode: _passwordFocusNode,
              onCreated: (controller) {
                _passwordTextController = controller;
              },
              onSubmitted: _onLoginPressed,
            ),
            AppButton(
              margin: const EdgeInsets.symmetric(vertical: defaultMarginValue),
              text: '로그인'.tr(),
              textBold: true,
              onPressed: _onLoginPressed,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: UnderlineTextButton(
                text: '아이디 찾기'.tr(),
                margin: EdgeInsets.zero,
                onPressed: _onFindIdPressed,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: UnderlineTextButton(
                text: '비밀번호 재설정'.tr(),
                margin: const EdgeInsets.symmetric(vertical: 12),
                onPressed: _onFindPasswordPressed,
              ),
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                '회원이 아니신가요'.tr(),
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            AppButton(
              text: '회원가입'.tr(),
              textStyle: context.textTheme.bodyMedium,
              textColor: Colors.black,
              background: Colors.white,
              borderColor: AppColor.secondary,
              onPressed: _onJoinPressed,
            ),
          ],
        );
      },
    );
  }
}
