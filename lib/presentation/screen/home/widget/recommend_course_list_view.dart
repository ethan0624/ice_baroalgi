import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/filter_button.dart';

class RecommendCourseListView extends StatelessWidget {
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
            itemCount: recommends.length,
            itemBuilder: (context, index) {
              final recommand = recommends[index];
              return FilterButton(
                text: recommand.name,
                isSelected: recommand == selectedRecommend,
                onPressed: () => onRecommendChanged?.call(recommand),
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
                  .toList()),
        ),
      ],
    );
  }
}
