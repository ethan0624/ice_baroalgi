import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:incheon_knowhow/route/app_router.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/string_extension.dart';
import 'package:incheon_knowhow/domain/enum/user_type.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';
import 'package:incheon_knowhow/presentation/screen/join/regist/bloc/join_regist_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/icon_text.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';
import 'package:incheon_knowhow/presentation/widget/password_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/school_search_form_field.dart';

@RoutePage()
class JoinRegistScreen extends StatefulWidget {
  final JoinData joinData;
  const JoinRegistScreen({super.key, required this.joinData});

  @override
  State<JoinRegistScreen> createState() => _JoinRegistScreenState();
}

class _JoinRegistScreenState extends State<JoinRegistScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailTextController = TextEditingController();
  late TextEditingController _passwordTextController;
  late TextEditingController _confirmPasswordTextController;
  final _schoolNameTextController = TextEditingController();
  final _schoolGradeTextController = TextEditingController();
  final _schoolClassTextController = TextEditingController();

  bool _isEmailInput = false;
  bool _isEmailVaild = false;

  bool _isPasswordValidate = true;

  _passwordValidate() {
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

  _onDulicateEmailPressed() {
    if (!_isEmailVaild) {
      context.showAlert(title: '입력오류'.tr(), message: '이메일을 정확하게 입력해주세요'.tr());
      return;
    }

    final bloc = _scaffoldKey.currentContext?.read<JoinRegistBloc>();
    if (bloc == null) return;

    bloc.add(JoinRegistEvent.checkEmail(_emailTextController.text));
  }

  _onEmailChanged() {
    setState(() {
      final email = _emailTextController.text;
      _isEmailInput = email.isNotEmpty;
      _isEmailVaild = email.isValidEmail();
    });

    final bloc = _scaffoldKey.currentContext?.read<JoinRegistBloc>();
    if (bloc == null) return;

    bloc.add(const JoinRegistEvent.changedEmail());
  }

  _onPasswordChanged() {
    _passwordValidate();
  }

  _onJoinPressed() {
    if (widget.joinData.type == UserType.student) {
      if (_schoolNameTextController.text.isEmpty) {
        context.showAlert(title: '입력오류'.tr(), message: '학교명을 입력해주세요'.tr());
        return;
      }

      if (_schoolGradeTextController.text.isEmpty) {
        context.showAlert(title: '입력오류'.tr(), message: '학년을 입력해주세요'.tr());
        return;
      }

      if (_schoolClassTextController.text.isEmpty) {
        context.showAlert(title: '입력오류'.tr(), message: '반을 입력해주세요'.tr());
        return;
      }
    }

    final bloc = _scaffoldKey.currentContext?.read<JoinRegistBloc>();
    if (bloc == null) return;

    bloc.add(JoinRegistEvent.regist(
      email: _emailTextController.text,
      password: _passwordTextController.text,
      schoolName: _schoolNameTextController.text,
      schoolGrade: _schoolGradeTextController.text,
      schoolClass: _schoolClassTextController.text,
    ));
  }

  @override
  void initState() {
    super.initState();
    _emailTextController.addListener(_onEmailChanged);
  }

  @override
  void dispose() {
    _emailTextController.removeListener(_onEmailChanged);
    _passwordTextController.removeListener(_onPasswordChanged);
    _confirmPasswordTextController.removeListener(_onPasswordChanged);
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<JoinRegistBloc, JoinRegistBloc,
        JoinRegistState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '회원가입'.tr()),
      create: (_) => JoinRegistBloc(joinData: widget.joinData),
      effectChanged: (context, effect) {
        if (effect is SuccessEffect) {
          context.router.replace(
              JoinCompleteRoute(userName: widget.joinData.userName ?? ''));
        }
      },
      builder: (context, bloc, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultMarginValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '서비스이용을 위해 아래정보를 입력해주세요'.tr(),
                  style: context.textTheme.titleSmall,
                ),
                const SizedBox(height: 50),
                Text(
                  '이메일(아이디)'.tr(),
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        controller: _emailTextController,
                        hintText: '이메일 입력'.tr(),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlineButton(
                      text: '중복확인'.tr(),
                      backgroundColor: AppColor.secondaryBackground,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      onPressed: _onDulicateEmailPressed,
                    ),
                  ],
                ),
                if (_isEmailInput && !_isEmailVaild)
                  IconText(
                    icon: SvgPicture.asset(
                      'assets/images/ic_close.svg',
                      width: 20,
                      height: 20,
                      colorFilter:
                          const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                    ),
                    label: '이메일 형식이 잘못되었습니다'.tr(),
                  ),
                if (_isEmailVaild &&
                    state.isDuplicateRequest &&
                    !state.canUseEmail)
                  IconText(
                    icon: SvgPicture.asset(
                      'assets/images/ic_close.svg',
                      width: 20,
                      height: 20,
                      colorFilter:
                          const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                    ),
                    label: '이미 가입된 이메일입니다'.tr(),
                  ),
                const SizedBox(height: defaultMarginValue),
                Text(
                  '비밀번호'.tr(),
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                PasswordFormField(
                  onCreated: (controller) {
                    _passwordTextController = controller;
                    _passwordTextController.addListener(_onPasswordChanged);
                  },
                ),
                PasswordFormField(
                  hint: '비밀번호 확인'.tr(),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  onCreated: (controller) {
                    _confirmPasswordTextController = controller;
                    _confirmPasswordTextController
                        .addListener(_onPasswordChanged);
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
                if (widget.joinData.type == UserType.student)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: defaultMarginValue),
                      Text(
                        '학교'.tr(),
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      SchoolSearchFormField(
                          controller: _schoolNameTextController),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextFormField(
                              controller: _schoolGradeTextController,
                              hintText: '학년 입력'.tr(),
                              margin: EdgeInsets.zero,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AppTextFormField(
                              controller: _schoolClassTextController,
                              hintText: '반 입력'.tr(),
                              margin: EdgeInsets.zero,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                const SizedBox(height: 50),
                AppButton(
                  text: '가입완료'.tr(),
                  textBold: true,
                  background: (_isEmailVaild &&
                          state.canUseEmail &&
                          _isPasswordValidate)
                      ? AppColor.primary
                      : Colors.grey,
                  onPressed: (_isEmailVaild &&
                          state.canUseEmail &&
                          _isPasswordValidate)
                      ? _onJoinPressed
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
