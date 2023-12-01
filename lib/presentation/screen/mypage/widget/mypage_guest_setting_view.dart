import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/screen/mypage/widget/mypage_setting_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/section_divider.dart';

class MypageGuestSettingView extends StatelessWidget {
  const MypageGuestSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 26),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            '로그인이 필요합니다',
            style: context.textTheme.titleSmall,
          ),
        ),
        const SectionDivider(
          margin: EdgeInsets.symmetric(vertical: 26),
        ),
        MypageSettingListItem(
          title: '언어',
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => context.router.pushNamed('/language'),
        ),
        MypageSettingListItem(
          title: '공지사항',
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => context.router.pushNamed('/notice'),
        ),
        MypageSettingListItem(
          title: '고객센터',
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () {
            // todo :
          },
        ),
        MypageSettingListItem(
          title: '앱 버전정보',
          tail: Text(
            '1.0.0',
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
