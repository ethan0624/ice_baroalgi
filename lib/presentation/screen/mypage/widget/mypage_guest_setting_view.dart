import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_info.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/screen/mypage/widget/mypage_setting_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/section_divider.dart';

class MypageGuestSettingView extends StatelessWidget {
  const MypageGuestSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: defaultMarginValue),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
          child: Text(
            '로그인이 필요합니다'.tr(),
            style: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SectionDivider(
          margin: EdgeInsets.symmetric(vertical: defaultMarginValue),
        ),
        MypageSettingListItem(
          title: '언어'.tr(),
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => context.router.pushNamed('/language'),
        ),
        MypageSettingListItem(
          title: '공지사항'.tr(),
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => context.router.pushNamed('/notice'),
        ),
        MypageSettingListItem(
          title: '고객센터'.tr(),
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => context.router.pushNamed('/cscenter/qna'),
        ),
        MypageSettingListItem(
          title: '사업자정보'.tr(),
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => context.router.pushNamed('/business'),
        ),
        MypageSettingListItem(
          title: '앱 버전정보'.tr(),
          tail: Text(
            AppInfo().appVersion,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
