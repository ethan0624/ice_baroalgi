import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';

class SpotFlagCompletedDialog extends StatelessWidget {
  const SpotFlagCompletedDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return const SpotFlagCompletedDialog();
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
            '깃발을 등록했습니다!',
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'assets/images/ic_flag_completed.png',
              width: 70,
              height: 70,
            ),
          ),
          OutlineButton(
            onPressed: () => context.router.pop(true),
            borderWidth: 2,
            borderRadius: 30,
            backgroundColor: AppColor.secondary,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            text: '등록완료',
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
