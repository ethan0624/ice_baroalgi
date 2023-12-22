import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/util/birth_formatter.dart';
import 'package:incheon_knowhow/core/util/number_formatter.dart';
import 'package:incheon_knowhow/domain/model/find_id_result.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/find_id/bloc/find_id_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/underline_text_button.dart';
import 'package:provider/provider.dart';

@RoutePage()
class FindIdScreen extends StatefulWidget {
  const FindIdScreen({super.key});

  @override
  State<FindIdScreen> createState() => _FindIdScreenState();
}

class _FindIdScreenState extends State<FindIdScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _nameTextController = TextEditingController();
  final _birthTextController = TextEditingController();
  final _phoneTextController = TextEditingController();
  final _nameFocus = FocusNode();
  final _birthFocus = FocusNode();
  final _phoneFocus = FocusNode();

  FindIdResult? _idResult;

  // todo : 생년월일 및 휴대폰번호 포멧팅

  _onFindPressed() async {
    final name = _nameTextController.text;
    final birth = _birthTextController.text;
    final phone = _phoneTextController.text;

    if (name.isEmpty) {
      await context.showAlert(title: '입력오류', message: '이름을 입력해주세요');
      _nameFocus.requestFocus();
      return;
    }

    if (birth.isEmpty) {
      await context.showAlert(title: '입력오류', message: '생년월일을 입력해주세요');
      _birthFocus.requestFocus();
      return;
    }

    if (phone.isEmpty) {
      await context.showAlert(title: '입력오류', message: '휴대폰번호를 입력해주세요');
      _phoneFocus.requestFocus();
      return;
    }

    final bloc = _scaffoldKey.currentContext?.read<FindIdBloc>();
    if (bloc == null) return;

    bloc.add(FindIdEvent.request(name: name, birth: birth, phone: phone));
  }

  _handleEffectChanged(BlocEffect effect) {
    if (effect is SuccessEffect) {
      setState(() {
        _idResult = effect.data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<FindIdBloc, FindIdBloc, FindIdState>(
      scaffoldKey: _scaffoldKey,
      create: (_) => FindIdBloc(),
      appBar: AppSubAppBar(
        text: '아이디 찾기',
      ),
      effectChanged: (context, effect) {
        _handleEffectChanged(effect);
      },
      builder: (context, bloc, state) {
        return Padding(
          padding: const EdgeInsets.all(defaultMarginValue),
          child: SingleChildScrollView(
            child: AnimatedCrossFade(
              crossFadeState: _idResult != null
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: AnimationDuration.shortest,
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '아이디가 생각나지 않으세요?',
                    style: context.textTheme.titleSmall,
                  ),
                  Text(
                    '* 가입자 정보를 입력해주세요.',
                    style: context.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 50),
                  Text(
                    '이름',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  AppTextFormField(
                    controller: _nameTextController,
                    focusNode: _nameFocus,
                    hintText: '이름을 입력하세요',
                    textInputAction: TextInputAction.next,
                    onSubmitted: () {
                      if (_nameTextController.text.isNotEmpty) {
                        _birthFocus.requestFocus();
                      }
                    },
                  ),
                  const SizedBox(height: defaultMarginValue),
                  Text(
                    '생년월일',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  AppTextFormField(
                    controller: _birthTextController,
                    focusNode: _birthFocus,
                    hintText: 'YYYY / MM / DD',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [BirthFormatter()],
                    onSubmitted: () {
                      if (_birthTextController.text.isNotEmpty) {
                        _phoneFocus.requestFocus();
                      }
                    },
                  ),
                  const SizedBox(height: defaultMarginValue),
                  Text(
                    '휴대폰 번호',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  AppTextFormField(
                    controller: _phoneTextController,
                    focusNode: _phoneFocus,
                    hintText: '가입자의 휴대폰 번호를 입력하세요',
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    inputFormatters: [NumberFormatter()],
                    onSubmitted: () {
                      if (_phoneTextController.text.isNotEmpty) {
                        _onFindPressed();
                      }
                    },
                  ),
                  const SizedBox(height: 56),
                  AppButton(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    text: '아이디 찾기',
                    textBold: true,
                    onPressed: _onFindPressed,
                  ),
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '아이디 찾기를 완료하였습니다.',
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: AppColor.dividerLight),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '아이디',
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: AppTextColor.light),
                        ),
                        Text(
                          _idResult?.email ?? '',
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultMarginValue),
                  AppButton(
                    margin: EdgeInsets.zero,
                    text: '로그인 하기',
                    textBold: true,
                    onPressed: () => context.router.pop(),
                  ),
                  Center(
                    child: UnderlineTextButton(
                      text: '비밀번호가 생각나지 않으세요?',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
