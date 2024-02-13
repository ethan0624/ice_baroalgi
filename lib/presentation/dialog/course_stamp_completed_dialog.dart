import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';

class CourseStampCompletedDialog extends StatelessWidget {
  final String courseName;
  const CourseStampCompletedDialog({
    super.key,
    required this.courseName,
  });

  static show(BuildContext context, {required String courseName}) {
    return showDialog(
      context: context,
      builder: (context) {
        return CourseStampCompletedDialog(
          courseName: courseName,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.all(24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '코스 정복 스탬프가 발행되었습니다'.tr(namedArgs: {
              'courseName': courseName,
            }),
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SvgPicture.asset(
              'assets/images/ic_completed.svg',
              width: 70,
              height: 70,
              colorFilter: ColorFilter.mode(AppColor.primary, BlendMode.srcIn),
            ),
          ),
          OutlineButton(
            onPressed: () => context.router.pop(),
            borderWidth: 2,
            borderRadius: 30,
            backgroundColor: AppColor.secondary,
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 10),
            text: '메인으로 돌아가기'.tr(),
            textStyle: context.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
