import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/widget/label.dart';
import 'package:incheon_knowhow/presentation/widget/progress_bar.dart';
import 'package:incheon_knowhow/presentation/widget/thumbnail.dart';

class CourseListItem extends StatelessWidget {
  final Course course;
  final EdgeInsets margin;
  final EdgeInsets padding;
  const CourseListItem({
    super.key,
    required this.course,
    this.margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.pushNamed('/course/1/map'),
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColor.background),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Thumbnail(),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '미추홀구',
                        style: context.textTheme.labelMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        course.title,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Wrap(
                          spacing: 4,
                          children: [
                            Label(
                              text: '${course.km}km',
                              borderColor: AppColor.linePurple,
                            ),
                            Label(
                              text: (course.hour > 0 && course.min > 0)
                                  ? '${course.hour}시간 ${course.min}분 소요'
                                  : (course.hour > 0)
                                      ? '${course.hour}시간 소요'
                                      : '${course.min}분 소요',
                              borderColor: AppColor.lineBlue,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            const Expanded(
                              child: ProgressBar(value: 0.5),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              '3/6',
                              style: context.textTheme.labelMedium
                                  ?.copyWith(color: AppTextColor.light),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 0,
              right: 0,
              child: Icon(
                Icons.favorite_outline,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
