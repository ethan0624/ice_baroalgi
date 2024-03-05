import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/filter_button.dart';

class RecommendCourseListView extends StatefulWidget {
  final List<Category> recommends;
  final List<Course> courseList;
  final Category? selectedRecommend;
  final ValueChanged<Category>? onRecommendChanged;

  const RecommendCourseListView({
    super.key,
    required this.recommends,
    required this.courseList,
    this.selectedRecommend,
    this.onRecommendChanged,
  });

  @override
  State<RecommendCourseListView> createState() =>
      _RecommendCourseListViewState();
}

class _RecommendCourseListViewState extends State<RecommendCourseListView> {
  bool _isHideCompletedCourse = false;

  _onToggleHideCompleteCourse() {
    setState(() {
      _isHideCompletedCourse = !_isHideCompletedCourse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey('home-recommend-list'),
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 30,
          child: ListView.separated(
            key: const PageStorageKey('home-recommend-category-list'),
            padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
            scrollDirection: Axis.horizontal,
            itemCount: widget.recommends.length,
            itemBuilder: (context, index) {
              final recommand = widget.recommends[index];
              return FilterButton(
                text: recommand.name,
                isSelected: recommand == widget.selectedRecommend,
                onPressed: () => widget.onRecommendChanged?.call(recommand),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 코스'.tr(namedArgs: {
                  'total': widget.courseList.length.toNumberFormat,
                }),
                style: context.textTheme.labelMedium?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: _onToggleHideCompleteCourse,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    IgnorePointer(
                      child: AppCheckbox(
                        isChecked: _isHideCompletedCourse,
                        onCheckChanged: (value) =>
                            _onToggleHideCompleteCourse(),
                      ),
                    ),
                    Text(
                      '완료코스 숨김'.tr(),
                      style: context.textTheme.labelMedium?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: AppColor.background,
          child: Column(
              children: widget.courseList
                  .where(
                      (e) => (_isHideCompletedCourse) ? !e.isCompleted : true)
                  .map((e) => CourseListItem(
                        course: e,
                      ))
                  .toList()),
        ),
      ],
    );
  }
}
