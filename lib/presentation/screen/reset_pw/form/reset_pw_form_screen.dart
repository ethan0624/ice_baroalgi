import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/string_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/form/bloc/reset_pw_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/route/app_router.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ResetPwFormScreen extends StatefulWidget {
  const ResetPwFormScreen({super.key});

  @override
  State<ResetPwFormScreen> createState() => _ResetPwFormScreenState();
}

class _ResetPwFormScreenState extends State<ResetPwFormScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  _onCertificationPressed() async {
    if (_nameTextController.text.isEmpty) {
      await context.showAlert(title: '입력오류'.tr(), message: '이름을 입력해주세요'.tr());
      _nameFocusNode.requestFocus();
      return;
    }

    if (_emailTextController.text.isEmpty) {
      await context.showAlert(title: '입력오류'.tr(), message: '이메일을 입력해주세요'.tr());
      _emailFocusNode.requestFocus();
      return;
    }

    if (!_emailTextController.text.isValidEmail()) {
      await context.showAlert(
          title: '입력오류'.tr(), message: '올바른 이메일 형식을 입력해주세요'.tr());
      _emailFocusNode.requestFocus();
      return;
    }

    final bloc = _scaffoldKey.currentContext?.read<ResetPwBloc>();
    if (bloc == null) return;

    FocusManager.instance.primaryFocus?.unfocus();
    bloc.add(
        ResetPwEvent.find(_nameTextController.text, _emailTextController.text));
  }

  _handleEffect(BlocEffect effect) {
    if (effect is SuccessEffect) {
      context.router
          .replace(ResetPwCertificationRoute(certificationCode: effect.data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<ResetPwBloc, ResetPwBloc, ResetPwState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '비밀번호 재설정'.tr()),
      create: (_) => ResetPwBloc(),
      effectChanged: (context, effect) {
        _handleEffect(effect);
      },
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.all(defaultMarginValue),
          children: [
            AppTitleText(
              text: '회원가입 시 등록한 이름과 이메일 입력 시 인증메일을 발송드립니다'.tr(),
            ),
            const SizedBox(height: 50),
            Text(
              '이름'.tr(),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            AppTextFormField(
              controller: _nameTextController,
              focusNode: _nameFocusNode,
              hintText: '이름을 입력하세요'.tr(),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: defaultMarginValue),
            Text(
              '이메일'.tr(),
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            AppTextFormField(
              controller: _emailTextController,
              focusNode: _emailFocusNode,
              hintText: '이메일 주소 입력'.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: defaultMarginValue),
            AppButton(
              text: '인증번호 받기'.tr(),
              onPressed: _onCertificationPressed,
            ),
          ],
        );
      },
    );
  }
}
