// ignore_for_file: use_build_context_synchronously
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
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

  _onPasswordChangePressed(User user) async {
    final isVerify = await context.router.pushNamed<bool>('/verify/pw');
    if (isVerify == null || !isVerify) return;

    // 딜레이를 주지 않을경우 핀번호 검증화면이 남아있게 되는 문제 있음(추후 update 화면을 추가 하는걸 고려)
    Future.delayed(const Duration(milliseconds: 18), () {
      _onPasswordUpdate(user.id);
    });
  }

  _onPasswordUpdate(int id) async {
    final ret = await context.router.pushNamed('/resetPw/update?userId=$id');
    if (ret == null || ret == false) return;

    context.showToast(message: '비밀번호가 변경되었습니다. 다시 로그인 해주세요').then((value) {
      final bloc = _scaffoldKey.currentContext?.read<AccountBloc>();
      if (bloc == null) return;

      bloc.add(const AccountEvent.logout());
    });
  }

  _onSchoolChangePressed() async {
    final ret = await context.router.pushNamed('/update/school');
    if (ret == null || ret == false) return;

    final bloc = _scaffoldKey.currentContext?.read<AccountBloc>();
    if (bloc == null) return;

    bloc.add(const AccountEvent.refresh());
  }

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
                    onTap: state.user != null
                        ? () => _onPasswordChangePressed(state.user!)
                        : null,
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
                    value: state.user?.schoolInfo ?? '',
                    showDivider: false,
                    onTap: _onSchoolChangePressed,
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
