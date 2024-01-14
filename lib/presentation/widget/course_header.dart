import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/widget/label.dart';

class CourseHeader extends StatelessWidget {
  final Course course;
  const CourseHeader({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultMarginValue),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.regionName ?? '',
            style: context.textTheme.labelMedium?.copyWith(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              course.title,
              style: context.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Wrap(
            spacing: 4,
            children: [
              Label(
                text: '${course.km}km',
                borderColor: AppColor.linePurple,
              ),
              Label(
                text: (course.hour > 0 && course.min > 0)
                    ? '시간 분 소요'.tr(namedArgs: {
                        'hour': '${course.hour}',
                        'min': '${course.min}'
                      })
                    : (course.hour > 0)
                        ? '시간 소요'.tr(namedArgs: {'hour': '${course.hour}'})
                        : '분 소요'.tr(namedArgs: {'min': '${course.min}'}),
                borderColor: AppColor.lineBlue,
              )
            ],
          ),
        ],
      ),
    );
  }
}
