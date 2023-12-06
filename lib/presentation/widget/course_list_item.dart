import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/label.dart';
import 'package:incheon_knowhow/presentation/widget/progress_bar.dart';

class CourseListItem extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  const CourseListItem({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
    this.padding = const EdgeInsets.all(14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColor.background),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey.shade200,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '미추홀구',
                      style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const Icon(Icons.favorite_outline),
                  ],
                ),
                Text(
                  '민주주의의 길',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Wrap(
                    spacing: 4,
                    children: [
                      Label(
                        text: '2km',
                        borderColor: AppColor.linePurple,
                      ),
                      Label(
                        text: '60분 소요',
                        borderColor: AppColor.lineBlue,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      const Expanded(
                        child: ProgressBar(value: 0.5),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        '3/6',
                        style: context.textTheme.labelLarge
                            ?.copyWith(color: AppTextColor.light),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
