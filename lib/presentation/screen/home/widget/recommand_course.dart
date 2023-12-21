import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/category.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/filter_button.dart';

class RecommandCourse extends StatefulWidget {
  final List<Category> recommands;
  const RecommandCourse({
    super.key,
    required this.recommands,
  });

  @override
  State<RecommandCourse> createState() => _RecommandCourseState();
}

class _RecommandCourseState extends State<RecommandCourse> {
  Category? _selectedRecommand;

  _onRecommandChanged(Category recommand) {
    setState(() {
      _selectedRecommand = recommand;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _selectedRecommand = widget.recommands.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 30,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: defaultMarginValue),
            scrollDirection: Axis.horizontal,
            itemCount: widget.recommands.length,
            itemBuilder: (context, index) {
              final recommand = widget.recommands[index];
              return FilterButton(
                text: recommand.name,
                isSelected: recommand == _selectedRecommand,
                onPressed: () => _onRecommandChanged(recommand),
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
                '총 87코스',
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
              children: Course.mocks()
                  .map((e) => CourseListItem(
                        course: e,
                      ))
                  .toList()),
        ),
      ],
    );
  }
}
