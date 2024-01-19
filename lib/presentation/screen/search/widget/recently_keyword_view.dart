import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/underline_text_button.dart';

class RecentlyKeywordView extends StatelessWidget {
  final List<String> keywords;
  final ValueChanged<String>? onKeywordPressed;
  final VoidCallback? onClearPressed;
  final ValueChanged<String>? onDeletePressed;
  const RecentlyKeywordView({
    super.key,
    this.keywords = const [],
    this.onKeywordPressed,
    this.onClearPressed,
    this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '최근검색어'.tr(),
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (keywords.isNotEmpty)
                UnderlineTextButton(
                  text: '전체삭제'.tr(),
                  onPressed: onClearPressed,
                ),
            ],
          ),
          const SizedBox(height: 24),
          if (keywords.isEmpty)
            Text(
              '최근검색어가 없습니다'.tr(),
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: AppTextColor.medium),
            ),
          ...keywords.map(
            (e) => InkWell(
              onTap: () => onKeywordPressed?.call(e),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppTextColor.dark,
                    ),
                  ),
                  IconButton(
                    onPressed: () => onDeletePressed?.call(e),
                    icon: const Icon(
                      Icons.close,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
