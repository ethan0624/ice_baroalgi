import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/update/bloc/reset_pw_update_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/icon_text.dart';
import 'package:incheon_knowhow/presentation/widget/password_form_field.dart';
import 'package:provider/provider.dart';

@RoutePage<bool>()
class ResetPwUpdateScreen extends StatefulWidget {
  final int? userId;
  const ResetPwUpdateScreen({
    super.key,
    @queryParam this.userId,
  });

  @override
  State<ResetPwUpdateScreen> createState() => _ResetPwUpdateScreenState();
}

class _ResetPwUpdateScreenState extends State<ResetPwUpdateScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _passwordTextController;
  late TextEditingController _confirmPasswordTextController;

  bool _isPasswordValidate = true;

  _validate() {
    setState(() {
      if (_passwordTextController.text.isEmpty ||
          _confirmPasswordTextController.text.isEmpty) {
        _isPasswordValidate = true;
        return;
      }

      _isPasswordValidate =
          _passwordTextController.text == _confirmPasswordTextController.text;
    });
  }

  _onTextChanged() {
    _validate();
  }

  _onUpdatePressed() {
    if (_passwordTextController.text.isEmpty) {
      context.showAlert(title: '입력오류'.tr(), message: '비밀번호를 입력해주세요'.tr());
      return;
    }

    if (_confirmPasswordTextController.text.isEmpty) {
      context.showAlert(title: '입력오류'.tr(), message: '비밀번호 확인을 입력해주세요'.tr());
      return;
    }

    if (_confirmPasswordTextController.text != _passwordTextController.text) {
      context.showAlert(
          title: '입력오류'.tr(), message: '비밀번호와 비밀번호 확인이 일치하지 않습니다'.tr());
      return;
    }

    final bloc = _scaffoldKey.currentContext?.read<ResetPwUpdateBloc>();
    if (bloc == null) return;

    bloc.add(ResetPwUpdateEvent.submit(_passwordTextController.text));
  }

  _onSuccess() {
    // todo : show toast
    context.router.pop(true);
    // context.router.popUntil((route) {
    //   return !(route.data?.path.contains('resetPw') ?? false);
    // });
  }

  @override
  void dispose() {
    _passwordTextController.removeListener(_onTextChanged);
    _confirmPasswordTextController.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<ResetPwUpdateBloc, ResetPwUpdateBloc,
        ResetPwUpdateState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '비밀번호 재설정'.tr()),
      create: (_) => ResetPwUpdateBloc(userId: widget.userId ?? 0),
      effectChanged: (context, effect) {
        if (effect is SuccessEffect) {
          _onSuccess();
        }
      },
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.all(defaultMarginValue),
          children: [
            AppTitleText(
              text: '새로운 비밀번호를 입력해주세요'.tr(),
            ),
            const SizedBox(height: 50),
            Text(
              '비밀번호'.tr(),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            PasswordFormField(
              onCreated: (controller) {
                _passwordTextController = controller;
                _passwordTextController.addListener(_onTextChanged);
              },
            ),
            PasswordFormField(
              hint: '비밀번호 확인'.tr(),
              margin: const EdgeInsets.symmetric(vertical: 8),
              onCreated: (controller) {
                _confirmPasswordTextController = controller;
                _confirmPasswordTextController.addListener(_onTextChanged);
              },
            ),
            Offstage(
              offstage: _isPasswordValidate,
              child: IconText(
                icon: SvgPicture.asset(
                  'assets/images/ic_close.svg',
                  width: 20,
                  height: 20,
                  colorFilter:
                      const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                ),
                label: '비밀번호와 비밀번호 확인이 일치하지 않습니다'.tr(),
              ),
            ),
            const SizedBox(height: defaultMarginValue),
            AppButton(
              text: '비밀번호 변경완료'.tr(),
              onPressed: _onUpdatePressed,
            ),
          ],
        );
      },
    );
  }
}
