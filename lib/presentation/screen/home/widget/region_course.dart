import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/filter_button.dart';

class RegionCourse extends StatefulWidget {
  final ScrollController? scrollController;
  const RegionCourse({super.key, this.scrollController});

  @override
  State<RegionCourse> createState() => _RegionCourseState();
}

class _RegionCourseState extends State<RegionCourse> {
  final _regionFillters = [
    '전체',
    '강화군',
    '옹진군',
    '중구/동구/미추홀구',
    '남동구/연수구',
    '부평구/계양구/서구'
  ];
  final List<String> _selectedRegion = [];

  _onRegionChanged(String region) {
    setState(() {
      if (_selectedRegion.contains(region)) {
        _selectedRegion.remove(region);
      } else {
        _selectedRegion.add(region);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _selectedRegion.add(_regionFillters.first);
      });
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
            itemCount: _regionFillters.length,
            itemBuilder: (context, index) {
              final region = _regionFillters[index];
              return FilterButton(
                text: region,
                isSelected: _selectedRegion.contains(region),
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
              children: List.generate(30, (index) => const CourseListItem())),
        ),
      ],
    );
  }
}
