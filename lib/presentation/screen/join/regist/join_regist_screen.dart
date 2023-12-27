import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/user_type.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/join/join_data.dart';
import 'package:incheon_knowhow/presentation/screen/join/regist/bloc/join_regist_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/icon_text.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';
import 'package:incheon_knowhow/presentation/widget/password_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/school_search_form_field.dart';
import 'package:incheon_knowhow/route/app_router.dart';

@RoutePage()
class JoinRegistScreen extends StatefulWidget {
  final JoinData joinData;
  const JoinRegistScreen({super.key, required this.joinData});

  @override
  State<JoinRegistScreen> createState() => _JoinRegistScreenState();
}

class _JoinRegistScreenState extends State<JoinRegistScreen> {
  final _schoolTextController = TextEditingController();

  _onJoinPressed() {
    context.router.replace(JoinCompleteRoute(userName: 'TEST'));
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<JoinRegistBloc, JoinRegistBloc,
        JoinRegistState>(
      appBar: AppSubAppBar(text: '회원가입'),
      create: (_) => JoinRegistBloc(),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.all(defaultMarginValue),
          children: [
            Text(
              '서비스이용을 위해\n아래정보를 입력해주세요.',
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: 50),
            Text(
              '이메일(아이디)',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                const Expanded(
                  child: AppTextFormField(
                    hintText: '이메일 입력',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(width: 8),
                OutlineButton(
                  text: '중복확인',
                  backgroundColor: AppColor.secondaryBackground,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  onPressed: () {},
                ),
              ],
            ),
            IconText(
              icon: SvgPicture.asset(
                'assets/images/ic_close.svg',
                width: 20,
                height: 20,
                colorFilter:
                    const ColorFilter.mode(Colors.red, BlendMode.srcIn),
              ),
              label: '이메일 형식이 잘못되었습니다.',
            ),
            IconText(
              icon: SvgPicture.asset(
                'assets/images/ic_close.svg',
                width: 20,
                height: 20,
                colorFilter:
                    const ColorFilter.mode(Colors.red, BlendMode.srcIn),
              ),
              label: '이미 가입된 이메일입니다.',
            ),
            const SizedBox(height: defaultMarginValue),
            Text(
              '비밀번호',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const PasswordFormField(),
            const PasswordFormField(
              hint: '비밀번호 확인',
              margin: EdgeInsets.symmetric(vertical: 4),
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
            if (widget.joinData.type == UserType.student)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: defaultMarginValue),
                  Text(
                    '학교',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SchoolSearchFormField(controller: _schoolTextController),
                  const Row(
                    children: [
                      Expanded(
                        child: AppTextFormField(
                          hintText: '학년 입력',
                          margin: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: AppTextFormField(
                          hintText: '반 입력',
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
              text: '가입완료',
              textBold: true,
              onPressed: _onJoinPressed,
            ),
          ],
        );
      },
    );
  }
}
