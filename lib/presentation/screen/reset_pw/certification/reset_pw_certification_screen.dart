import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/reset_pw/certification/bloc/reset_pw_certification_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/icon_text.dart';
import 'package:incheon_knowhow/presentation/widget/underline_text_button.dart';

@RoutePage()
class ResetPwCertificationScreen extends StatefulWidget {
  const ResetPwCertificationScreen({super.key});

  @override
  State<ResetPwCertificationScreen> createState() =>
      _ResetPwCertificationScreenState();
}

class _ResetPwCertificationScreenState
    extends State<ResetPwCertificationScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _onNext() {
    context.router.pushNamed('/resetPw/update');
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<ResetPwCertificationBloc,
        ResetPwCertificationBloc, ResetPwCertificationState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '비밀번호 재설정'),
      create: (_) => ResetPwCertificationBloc(),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.all(defaultMarginValue),
          children: [
            const AppTitleText(
              text: 'sample@sample.com으로\n인증번호를 발송했습니다.',
            ),
            const SizedBox(height: 50),
            Text(
              '인증번호',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            const AppTextFormField(
              hintText: '인증번호 6자리 입력',
              keyboardType: TextInputType.number,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconText(
                        icon: SvgPicture.asset(
                          'assets/images/ic_close.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                              Colors.red, BlendMode.srcIn),
                        ),
                        label: '인증번호가 다릅니다.',
                      ),
                      IconText(
                        icon: SvgPicture.asset(
                          'assets/images/ic_checked.svg',
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                              Colors.green, BlendMode.srcIn),
                        ),
                        label: '인증되었습니다!',
                      ),
                    ],
                  ),
                ),
                UnderlineTextButton(
                  text: '인증번호 재발송',
                  margin: EdgeInsets.zero,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 78),
            AppButton(
              text: '다음',
              onPressed: _onNext,
            ),
          ],
        );
      },
    );
  }
}
