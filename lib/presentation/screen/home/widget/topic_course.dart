import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
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
  int _expendedIndex = -1;

  _onChangedExpanedIndex(int index, bool isExpaned) {
    setState(() {
      _expendedIndex = isExpaned ? index : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 5주제',
                style: context.textTheme.labelMedium?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const AppCheckbox(),
                  Text(
                    '완료코스 숨김',
                    style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
        ...List.generate(10, (index) {
          return CourseTopicExpansion(
            expended: index == _expendedIndex,
            onExpended: (isExpaned) {
              _onChangedExpanedIndex(index, isExpaned);
            },
          );
        }),
      ],
    );
  }
}
