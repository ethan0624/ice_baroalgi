// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_topic_expansion.dart';

class TopicCourse extends StatefulWidget {
  final List<Category> categories;
  final ScrollController? scrollController;
  const TopicCourse({
    super.key,
    required this.categories,
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
                '총 ${widget.categories.length.toNumberFormat}주제',
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
        ...widget.categories.mapIndexed((index, e) => CourseTopicExpansion(
              category: e,
              expended: index == _expendedIndex,
              onExpended: (isExpaned) {
                _onChangedExpanedIndex(index, isExpaned);
              },
            )),
      ],
    );
  }
}
