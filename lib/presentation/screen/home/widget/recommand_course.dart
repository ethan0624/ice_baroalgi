import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/filter_button.dart';

class RecommandCourse extends StatefulWidget {
  const RecommandCourse({super.key});

  @override
  State<RecommandCourse> createState() => _RecommandCourseState();
}

class _RecommandCourseState extends State<RecommandCourse> {
  final _recommandFillters = ['강추코스', '초', '중', '고'];
  String _selectedRecommand = '';

  _onRecommandChanged(String recommand) {
    setState(() {
      _selectedRecommand = recommand;
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _selectedRecommand = _recommandFillters.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 14),
          height: 34,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            scrollDirection: Axis.horizontal,
            itemCount: _recommandFillters.length,
            itemBuilder: (context, index) {
              final recommand = _recommandFillters[index];
              return FilterButton(
                text: recommand,
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
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '총 87코스',
                style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const AppCheckbox(),
                  Text(
                    '완료코스 숨김',
                    style: context.textTheme.labelLarge?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: AppColor.background,
          child: Column(
              children: List.generate(30, (index) => const CourseListItem())),
        ),
      ],
    );
  }
}
