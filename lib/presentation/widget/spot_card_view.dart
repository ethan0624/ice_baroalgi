import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:incheon_knowhow/presentation/widget/outline_button.dart';
import 'package:incheon_knowhow/presentation/widget/thumbnail.dart';

class SpotCardView extends StatelessWidget {
  final Spot spot;
  final bool enabledRegistButton;
  final Function(Spot spot)? onRegistPressed;
  const SpotCardView({
    super.key,
    required this.spot,
    this.enabledRegistButton = false,
    this.onRegistPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed(spot.detailRoutePath),
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: 12, horizontal: defaultMarginValue),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
              )
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Thumbnail(
              imageUrl: spot.image ?? '',
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    spot.title,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      spot.address ?? '',
                      style: context.textTheme.labelMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    spot.summary ?? '',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: AppTextColor.medium,
                    ),
                    maxLines: enabledRegistButton ? 1 : 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (enabledRegistButton)
                    OutlineButton(
                      margin: const EdgeInsets.only(top: 6),
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 14),
                      text: '깃발등록하기',
                      textColor: Colors.white,
                      borderRadius: 30,
                      borderWidth: 0,
                      backgroundColor: AppColor.secondary,
                      onPressed: () => onRegistPressed?.call(spot),
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
