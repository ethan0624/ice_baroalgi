import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/route/app_router.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/push.dart';

class NotificationListItem extends StatefulWidget {
  final Push push;
  final VoidCallback? onPressed;
  const NotificationListItem({
    super.key,
    required this.push,
    this.onPressed,
  });

  @override
  State<NotificationListItem> createState() => _NotificationListItemState();
}

class _NotificationListItemState extends State<NotificationListItem> {
  bool _isRead = false;

  _onPressed() {
    setState(() {
      _isRead = true;
    });

    context.router.push(NotificationDetailRoute(push: widget.push));
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _isRead = widget.push.isRead;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey('push-message-${widget.push.id}-$_isRead'),
      onTap: _onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 12, horizontal: defaultMarginValue),
        color: _isRead ? Colors.white : AppColor.secondary.withOpacity(0.3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColor.primary,
              radius: 25,
              child: Image.asset('assets/images/ic_logo_text.png'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.push.title,
                    style: context.textTheme.labelMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.push.content != null &&
                      widget.push.content?.isNotEmpty == true)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        widget.push.content ?? '',
                        style: context.textTheme.bodySmall,
                        maxLines: 2,
                      ),
                    ),
                  Text(
                    widget.push.receivedDateString,
                    style: context.textTheme.labelMedium?.copyWith(
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
