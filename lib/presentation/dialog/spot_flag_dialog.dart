import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';

class SpotFlagDialog extends StatelessWidget {
  final String spotName;
  const SpotFlagDialog({super.key, required this.spotName});

  static Future<bool?> show(
    BuildContext context, {
    required String spotName,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return SpotFlagDialog(spotName: spotName);
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
            '에 도착했나요'.tr(namedArgs: {'spotName': spotName}),
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              'assets/images/ic_flag.png',
              width: 70,
              height: 70,
            ),
          ),
          OutlineButton(
            onPressed: () => context.router.pop(true),
            borderWidth: 2,
            borderRadius: 30,
            text: '깃발 등록하기'.tr(),
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
