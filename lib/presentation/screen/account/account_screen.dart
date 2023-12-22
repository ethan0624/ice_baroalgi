import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/account/bloc/account_bloc.dart';
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

  _onWithdrawPressed() {}

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
                  TextButton(onPressed: _onLogoutPressed, child: Text('로그아웃')),
                  TextButton(
                      onPressed: _onWithdrawPressed, child: Text('회원탈퇴')),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
