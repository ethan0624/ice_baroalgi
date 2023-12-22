// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_topic_expansion.dart';

class TopicCourse extends StatelessWidget {
  final List<Category> categories;
  final Category? expandedCategory;
  final ScrollController? scrollController;
  final Function(Category category, bool isExpaned)? onExpaned;
  const TopicCourse({
    super.key,
    required this.categories,
    this.expandedCategory,
    this.scrollController,
    this.onExpaned,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey('home-topic-list'),
      controller: scrollController,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 ${categories.length.toNumberFormat}주제',
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
        ...categories.mapIndexed((index, e) => CourseTopicExpansion(
              category: e,
              expended: e == expandedCategory,
              onExpended: (expaned) {
                onExpaned?.call(e, expaned);
              },
            )),
      ],
    );
  }
}
