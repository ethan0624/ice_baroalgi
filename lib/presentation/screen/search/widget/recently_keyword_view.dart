import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/underline_text_button.dart';

class RecentlyKeywordView extends StatelessWidget {
  const RecentlyKeywordView({super.key});

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
                '최근검색어',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              UnderlineTextButton(
                text: '전체삭제',
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            '최근검색어가 없습니다.',
            style: context.textTheme.bodyMedium
                ?.copyWith(color: AppTextColor.medium),
          ),
          ...List.generate(
            4,
            (index) {
              return InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '민주주의',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppTextColor.dark,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
