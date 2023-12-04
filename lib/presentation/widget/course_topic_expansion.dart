import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';

class CourseTopicExpansion extends StatefulWidget {
  final bool expended;
  const CourseTopicExpansion({super.key, this.expended = false});

  @override
  State<CourseTopicExpansion> createState() => _CourseTopicExpansionState();
}

class _CourseTopicExpansionState extends State<CourseTopicExpansion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 14,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 75,
                        height: 75,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    Text(
                      '주제별 제목',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              RotatedBox(
                quarterTurns: widget.expended ? 1 : 0,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 22,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        if (widget.expended)
          Container(
            width: double.infinity,
            color: AppColor.background,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: List.generate(5, (index) {
                return const CourseListItem();
              }),
            ),
          ),
      ],
    );
  }
}
