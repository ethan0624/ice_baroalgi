import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
import 'package:incheon_knowhow/domain/model/topic_course.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_topic_expansion.dart';

class TopicCourseListView extends StatefulWidget {
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
  State<TopicCourseListView> createState() => _TopicCourseListViewState();
}

class _TopicCourseListViewState extends State<TopicCourseListView> {
  bool _isHideCompletedCourse = false;

  _onToggleHideCompleteCourse() {
    setState(() {
      _isHideCompletedCourse = !_isHideCompletedCourse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey('home-topic-list'),
      controller: widget.scrollController,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 주제'.tr(namedArgs: {
                  'topicCount': widget.topicCourse
                      .where((e) => e.hasCourse)
                      .length
                      .toNumberFormat
                }),
                style: context.textTheme.labelMedium?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: _onToggleHideCompleteCourse,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    AppCheckbox(
                      isChecked: _isHideCompletedCourse,
                      onCheckChanged: (value) => _onToggleHideCompleteCourse(),
                    ),
                    Text(
                      '완료코스 숨김'.tr(),
                      style: context.textTheme.labelMedium?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ...widget.topicCourse
            .where((e) => e.hasCourse)
            .map((e) => CourseTopicExpansion(
                  topicCourse: e,
                  expended: e.id == widget.expandedTopicId,
                  visibleCompletedCourse: !_isHideCompletedCourse,
                  onExpended: (expaned) {
                    widget.onExpaned?.call(e.id, expaned);
                  },
                )),
      ],
    );
  }
}
