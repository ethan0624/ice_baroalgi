import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/filter_button.dart';

class RegionCourse extends StatefulWidget {
  final List<Category> regions;
  final List<Course> courseList;
  final ScrollController? scrollController;
  const RegionCourse({
    super.key,
    required this.regions,
    required this.courseList,
    this.scrollController,
  });

  @override
  State<RegionCourse> createState() => _RegionCourseState();
}

class _RegionCourseState extends State<RegionCourse> {
  Category? _selectedRegionCategory;
  bool _allSelected = true;

  _onRegionChanged(Category category) {
    setState(() {
      _selectedRegionCategory = category;
      _allSelected = false;
    });
  }

  _onAllSlected() {
    setState(() {
      _selectedRegionCategory = null;
      _allSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 30,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
            scrollDirection: Axis.horizontal,
            itemCount: widget.regions.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return FilterButton(
                  text: '전체',
                  isSelected: _allSelected,
                  onPressed: () => _onAllSlected(),
                );
              }
              final region = widget.regions[index - 1];
              return FilterButton(
                text: region.name,
                isSelected: region == _selectedRegionCategory,
                onPressed: () => _onRegionChanged(region),
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
                '총 ${widget.courseList.length.toNumberFormat}코스',
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
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: AppColor.background,
          child: Column(
            children: widget.courseList
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
