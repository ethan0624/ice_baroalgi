import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/mypage/bloc/mypage_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/mypage/widget/mypage_guest_setting_view.dart';
import 'package:incheon_knowhow/presentation/screen/mypage/widget/mypage_user_setting_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';

@RoutePage()
class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<MypageBloc, MypageBloc, MypageState>(
      create: (_) => MypageBloc()..add(const MypageEvent.initial()),
      appBar: AppSubAppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.router.pushNamed('/notification');
            },
            icon: SvgPicture.asset(
              'assets/images/ic_notification.svg',
              width: 28,
              height: 28,
            ),
          ),
        ],
      ),
      builder: (context, bloc, state) {
        return (state.userMe != null)
            ? MypageUserSettingView(user: state.userMe!)
            : const MypageGuestSettingView();
      },
    );
  }
}
