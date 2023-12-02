import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/find_id/bloc/find_id_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/underline_text_button.dart';

@RoutePage()
class FindIdScreen extends StatefulWidget {
  const FindIdScreen({super.key});

  @override
  State<FindIdScreen> createState() => _FindIdScreenState();
}

class _FindIdScreenState extends State<FindIdScreen> {
  bool _isFind = false;

  _onFindPressed() {
    setState(() {
      _isFind = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<FindIdBloc, FindIdBloc, FindIdState>(
      create: (_) => FindIdBloc(),
      appBar: AppSubAppBar(
        text: '아이디 찾기',
      ),
      builder: (context, bloc, state) {
        return Padding(
          padding: const EdgeInsets.all(26),
          child: AnimatedCrossFade(
            firstChild: ListView(
              children: [
                Text(
                  '아이디가 생각나지 않으세요?',
                  style: context.textTheme.titleSmall,
                ),
                Text(
                  '* 가입자 정보를 입력해주세요.',
                  style: context.textTheme.bodySmall,
                ),
                const SizedBox(height: 56),
                Text(
                  '이름',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const AppTextFormField(
                  hintText: '이름을 입력하세요',
                ),
                const SizedBox(height: 26),
                Text(
                  '생년월일',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const AppTextFormField(
                  hintText: 'YYYY / MM / DD',
                ),
                const SizedBox(height: 26),
                Text(
                  '휴대폰 번호',
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const AppTextFormField(
                  hintText: '가입자의 휴대폰 번호를 입력하세요',
                ),
                const SizedBox(height: 56),
                AppButton(
                  margin: const EdgeInsets.symmetric(vertical: 14),
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
                const SizedBox(height: 56),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColor.dividerLight),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '아이디',
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: AppTextColor.light),
                      ),
                      Text(
                        'sample@sample.com',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
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
            crossFadeState:
                _isFind ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: AnimationDuration.shortest,
          ),
        );
      },
    );
  }
}
