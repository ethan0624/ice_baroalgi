import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/account/bloc/account_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/account/widget/account_item_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _onLogoutPressed() async {
    final ret = await context.showConfirm(
      title: '로그아웃',
      message: '로그아웃 하시겠습니까?\n메인화면으로 이동합니다.',
    );
    if (ret != true) return;

    final bloc = _scaffoldKey.currentContext?.read<AccountBloc>();
    if (bloc == null) return;

    bloc.add(const AccountEvent.logout());
  }

  _onWithdrawPressed() {
    context.router.pushNamed('/withdraw');
  }

  _handleEffect(BlocEffect effect) {
    if (effect is SuccessEffect) {
      Future.delayed(AnimationDuration.shortest, () {
        context.router.popUntilRoot();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<AccountBloc, AccountBloc, AccountState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(
        text: '계정',
      ),
      create: (_) => AccountBloc()..add(const AccountEvent.initial()),
      effectChanged: (context, effect) {
        _handleEffect(effect);
      },
      builder: (context, bloc, state) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultMarginValue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTitleText(text: '계정정보'),
                  const SizedBox(height: 6),
                  AcountItemView(
                    label: '이메일',
                    value: state.user?.email ?? '',
                  ),
                  AcountItemView(
                    label: '비밀번호',
                    value: List.generate(8, (index) => '*').join(''),
                    showDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 6,
              color: AppColor.dividerLight,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultMarginValue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTitleText(text: '상세정보'),
                  const SizedBox(height: 6),
                  AcountItemView(
                    label: '이름',
                    value: state.user?.name ?? '',
                  ),
                  const AcountItemView(
                    label: '생년월일',
                    value: '',
                  ),
                  AcountItemView(
                    label: '성별',
                    value: state.user?.genderType.title ?? '',
                  ),
                  AcountItemView(
                    label: '휴대폰번호',
                    value: state.user?.phone ?? '',
                    onTap: () {},
                  ),
                  AcountItemView(
                    label: '학교',
                    value: state.user?.schoolName ?? '',
                    showDivider: false,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: 6,
              color: AppColor.dividerLight,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultMarginValue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTitleText(text: '계정관리'),
                  AppButton(
                    width: 200,
                    padding: EdgeInsets.zero,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    text: '로그아웃',
                    textStyle: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    centerText: false,
                    background: Colors.transparent,
                    onPressed: _onLogoutPressed,
                  ),
                  AppButton(
                    width: 200,
                    padding: EdgeInsets.zero,
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    text: '회원탈퇴',
                    textStyle: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                    centerText: false,
                    background: Colors.transparent,
                    onPressed: _onWithdrawPressed,
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
