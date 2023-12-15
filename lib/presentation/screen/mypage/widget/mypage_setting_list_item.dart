import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class MypageSettingListItem extends StatelessWidget {
  final String title;
  final Widget? tail;
  final VoidCallback? onPressed;
  const MypageSettingListItem({
    super.key,
    required this.title,
    this.tail,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultMarginValue, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: context.textTheme.bodyMedium,
              ),
            ),
            tail ?? Container(),
          ],
        ),
      ),
    );
  }
}
