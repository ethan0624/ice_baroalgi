import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
import 'package:incheon_knowhow/domain/model/topic_course.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_topic_expansion.dart';

class TopicCourseListView extends StatelessWidget {
  final List<TopicCourse> topicCourse;
  final int? expandedTopicId;
  final ScrollController? scrollController;
  final Function(int topicId, bool isExpaned)? onExpaned;

  const TopicCourseListView({
    super.key,
    required this.topicCourse,
    this.expandedTopicId,
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
                '총 ${topicCourse.where((e) => e.hasCourse).length.toNumberFormat}주제',
                style: context.textTheme.labelMedium?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const AppCheckbox(),
                  Text(
                    '완료코스 숨김'.tr(),
                    style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
        ...topicCourse
            .where((e) => e.hasCourse)
            .map((e) => CourseTopicExpansion(
                  topicCourse: e,
                  expended: e.id == expandedTopicId,
                  onExpended: (expaned) {
                    onExpaned?.call(e.id, expaned);
                  },
                )),
      ],
    );
  }
}
