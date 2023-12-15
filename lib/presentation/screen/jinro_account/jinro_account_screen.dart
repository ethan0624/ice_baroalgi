import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/jinro_account/bloc/jinro_account_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/underline_text_button.dart';

@RoutePage()
class JinroAccountScreen extends StatefulWidget {
  const JinroAccountScreen({super.key});

  @override
  State<JinroAccountScreen> createState() => _JinroAccountScreenState();
}

class _JinroAccountScreenState extends State<JinroAccountScreen> {
  _onAuthPressed() {
    context.router.pop();
  }

  _onSkipPressed() {
    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<JinroAccountBloc, JinroAccountBloc,
        JinroAccountState>(
      appBar: AppSubAppBar(text: '계정인증하기', elevation: 0),
      create: (_) => JinroAccountBloc(),
      builder: (context, bloc, state) {
        return Padding(
          padding: const EdgeInsets.all(defaultMarginValue),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppTitleText(text: '인천사이버진로교육원 회원이신가요?'),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: defaultMarginValue),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: defaultMarginValue),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: AppColor.secondary,
                        ),
                      ),
                      child: Row(
                        children: [
                          const AppCheckbox(),
                          const SizedBox(width: 18),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                  text: '인천사이버진로교육원',
                                  style: context.textTheme.bodySmall?.copyWith(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' 회원 인증 시 \n체험이력이 자동으로 업로드 됩니다.',
                                      style:
                                          context.textTheme.bodySmall?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '이메일(아이디)',
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const AppTextFormField(
                      hintText: '이메일 주소 입력',
                    ),
                    const SizedBox(height: 26),
                    Text(
                      '비밀번호',
                      style: context.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const AppTextFormField(
                      hintText: '비밀번호 입력',
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    AppButton(
                      text: '인증하기',
                      onPressed: _onAuthPressed,
                    ),
                    Center(
                      child: UnderlineTextButton(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        text: '건너뛰기',
                        onPressed: _onSkipPressed,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
