import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';

class NotificationListItem extends StatelessWidget {
  final bool isNew;
  final VoidCallback? onPressed;
  const NotificationListItem({
    super.key,
    this.isNew = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 26),
        color: isNew ? AppColor.secondary.withOpacity(0.3) : Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.primary,
              radius: 35,
              child: Image.asset('assets/images/ic_logo_text.png'),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '알림제목',
                    style: context.textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      '알림 내용이 작성됩니다. \n최대 2줄까지 내용이 노출됩니다.',
                      style: context.textTheme.bodySmall,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    '05월 05일',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: AppTextColor.light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
