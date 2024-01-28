import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';

class CourseStampDialog extends StatelessWidget {
  final String courseName;
  const CourseStampDialog({
    super.key,
    required this.courseName,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String courseName,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return CourseStampDialog(courseName: courseName);
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
            '코스의 모든 깃발을 등록했습니다!'.tr(
              namedArgs: {'courseName': courseName},
            ),
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
            ),
          ),
          OutlineButton(
            onPressed: () => context.router.pop(true),
            borderWidth: 2,
            borderRadius: 30,
            text: '정복 스탬프 발행하러 가기'.tr(),
            textStyle: context.textTheme.bodyMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
