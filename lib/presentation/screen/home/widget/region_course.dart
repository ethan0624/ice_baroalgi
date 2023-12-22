import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
import 'package:incheon_knowhow/domain/enum/region_category_type.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/filter_button.dart';

class RegionCourse extends StatelessWidget {
  final List<RegionCategoryType> regions;
  final RegionCategoryType selectedRegion;
  final List<Course> courseList;
  final ValueChanged<RegionCategoryType>? onRegionChanged;
  final ScrollController? scrollController;

  const RegionCourse({
    super.key,
    required this.regions,
    required this.selectedRegion,
    required this.courseList,
    this.onRegionChanged,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey('home-region-list'),
      controller: scrollController,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 30,
          child: ListView.separated(
            key: const PageStorageKey('home-region-category-list'),
            padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
            scrollDirection: Axis.horizontal,
            itemCount: regions.length,
            itemBuilder: (context, index) {
              final region = regions[index];
              return FilterButton(
                text: region.title,
                isSelected: region == selectedRegion,
                onPressed: () => onRegionChanged?.call(region),
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
                '총 ${courseList.length.toNumberFormat}코스',
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
            children: courseList
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
