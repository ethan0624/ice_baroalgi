import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
import 'package:incheon_knowhow/domain/enum/region_category_type.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/filter_button.dart';

class RegionCourseListView extends StatefulWidget {
  final List<RegionCategoryType> regions;
  final RegionCategoryType selectedRegion;
  final List<Course> courseList;
  final ValueChanged<RegionCategoryType>? onRegionChanged;
  final ScrollController? scrollController;

  const RegionCourseListView({
    super.key,
    required this.regions,
    required this.selectedRegion,
    required this.courseList,
    this.onRegionChanged,
    this.scrollController,
  });

  @override
  State<RegionCourseListView> createState() => _RegionCourseListViewState();
}

class _RegionCourseListViewState extends State<RegionCourseListView> {
  bool _isHideCompletedCourse = false;

  _onToggleHideCompleteCourse() {
    setState(() {
      _isHideCompletedCourse = !_isHideCompletedCourse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey('home-region-list'),
      controller: widget.scrollController,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 30,
          child: ListView.separated(
            key: const PageStorageKey('home-region-category-list'),
            padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
            scrollDirection: Axis.horizontal,
            itemCount: widget.regions.length,
            itemBuilder: (context, index) {
              final region = widget.regions[index];
              return FilterButton(
                text: region.title,
                isSelected: region == widget.selectedRegion,
                onPressed: () => widget.onRegionChanged?.call(region),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
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
                .where((e) => (_isHideCompletedCourse) ? !e.isCompleted : true)
                .map((e) => CourseListItem(
                      course: e,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
