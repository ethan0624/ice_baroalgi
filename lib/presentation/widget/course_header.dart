import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/label.dart';

class CourseHeader extends StatelessWidget {
  const CourseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '미추홀구',
            style: context.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              '민주주의의 길',
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Wrap(
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
        ],
      ),
    );
  }
}
