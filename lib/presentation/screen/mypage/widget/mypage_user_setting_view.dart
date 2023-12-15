import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/screen/mypage/widget/mypage_setting_list_item.dart';
import 'package:incheon_knowhow/presentation/screen/mypage/widget/mypage_setting_section_title.dart';
import 'package:incheon_knowhow/presentation/widget/section_divider.dart';

class MypageUserSettingView extends StatelessWidget {
  const MypageUserSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: defaultMarginValue),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
          child: Text(
            '이름',
            style: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SectionDivider(
          margin: EdgeInsets.symmetric(vertical: defaultMarginValue),
        ),
        const MypageSettingSectionTitle(title: '사용자설정'),
        MypageSettingListItem(
          title: '계정',
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () {
            // todo :
          },
        ),
        MypageSettingListItem(
          title: '언어',
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () => context.router.pushNamed('/language'),
        ),
        const SectionDivider(
          margin: EdgeInsets.symmetric(vertical: 26),
        ),
        const MypageSettingSectionTitle(title: '알림설정'),
        const MypageSettingListItem(
          title: '푸시알림',
        ),
        Container(
          color: AppColor.background,
          margin: const EdgeInsets.only(bottom: defaultMarginValue),
          padding: const EdgeInsets.symmetric(
              horizontal: defaultMarginValue, vertical: 12),
          child: Text(
            '알림 받기 활성화 시 마케팅 수신 동의로 간주됩니다.\n\n정보성 푸시 알림은 위 설정 여부와 무관하게 받을 수 있습니다.\n기기의 알림 설정은 휴대폰 설정에서 변경할 수 있습니다.',
            style: context.textTheme.labelMedium,
          ),
        ),
        const MypageSettingSectionTitle(title: '고객지원'),
        MypageSettingListItem(
          title: '앱 버전정보',
          tail: Text(
            '1.0.0',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
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
        const SectionDivider(
          margin: EdgeInsets.symmetric(vertical: defaultMarginValue),
        ),
        const MypageSettingSectionTitle(title: '서비스약관'),
        MypageSettingListItem(
          title: '이용약관',
          tail: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onPressed: () {
            // todo :
          },
        ),
        MypageSettingListItem(
          title: '개인정보처리방침',
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
