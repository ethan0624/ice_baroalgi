import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/checkbox_text.dart';
import 'package:incheon_knowhow/presentation/widget/course_topic_expansion.dart';

class TopicCourse extends StatefulWidget {
  final ScrollController? scrollController;
  const TopicCourse({
    super.key,
    this.scrollController,
  });

  @override
  State<TopicCourse> createState() => _TopicCourseState();
}

class _TopicCourseState extends State<TopicCourse> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 5주제',
                style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const AppCheckbox(),
                  Text(
                    '완료코스 숨김',
                    style: context.textTheme.labelLarge?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
        ...List.generate(10, (index) {
          return CourseTopicExpansion(
            expended: index == 0,
          );
        }),
      ],
    );
  }
}
