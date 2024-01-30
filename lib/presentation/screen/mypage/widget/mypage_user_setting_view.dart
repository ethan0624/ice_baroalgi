import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_info.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/user.dart';
import 'package:incheon_knowhow/presentation/screen/mypage/widget/mypage_setting_list_item.dart';
import 'package:incheon_knowhow/presentation/screen/mypage/widget/mypage_setting_section_title.dart';
import 'package:incheon_knowhow/presentation/widget/section_divider.dart';

class MypageUserSettingView extends StatelessWidget {
  final User user;
  const MypageUserSettingView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: defaultMarginValue),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
          child: Text(
            user.name,
            style: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SectionDivider(
          margin: EdgeInsets.symmetric(vertical: defaultMarginValue),
        ),
        MypageSettingSectionTitle(title: '사용자설정'.tr()),
        MypageSettingListItem(
          title: '계정'.tr(),
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => context.router.pushNamed('/account'),
        ),
        MypageSettingListItem(
          title: '언어'.tr(),
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => context.router.pushNamed('/language'),
        ),
        const SectionDivider(
          margin: EdgeInsets.symmetric(vertical: 26),
        ),
        MypageSettingSectionTitle(title: '알림설정'.tr()),
        MypageSettingListItem(
          title: '푸시알림'.tr(),
        ),
        Container(
          color: AppColor.background,
          margin: const EdgeInsets.only(bottom: defaultMarginValue),
          padding: const EdgeInsets.symmetric(
              horizontal: defaultMarginValue, vertical: 12),
          child: Text(
            '알림 받기 활성화 시 마케팅 수신 동의로 간주됩니다 정보성 푸시 알림은 위 설정 여부와 무관하게 받을 수 있습니다 기기의 알림 설정은 휴대폰 설정에서 변경할 수 있습니다'
                .tr(),
            style: context.textTheme.labelMedium,
          ),
        ),
        MypageSettingSectionTitle(title: '고객지원'.tr()),
        MypageSettingListItem(
          title: '앱 버전정보'.tr(),
          tail: Text(
            AppInfo().appVersion,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
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
        const SectionDivider(
          margin: EdgeInsets.symmetric(vertical: defaultMarginValue),
        ),
        MypageSettingSectionTitle(title: '서비스약관'.tr()),
        MypageSettingListItem(
          title: '이용약관'.tr(),
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () {
            // todo :
          },
        ),
        MypageSettingListItem(
          title: '개인정보처리방침'.tr(),
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () {
            // todo :
          },
        ),
      ],
    );
  }
}
