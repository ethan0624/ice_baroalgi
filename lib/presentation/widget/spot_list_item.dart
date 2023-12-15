import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/thumbnail.dart';

class SpotListItem extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  const SpotListItem({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed('/spot/1'),
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: AppColor.dividerLight,
          ),
        ),
        child: Row(
          children: [
            const Thumbnail(
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '주안역 뒷역',
                    style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '인천광역시 미추홀구 주안로 95-19',
                    style: context.textTheme.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
