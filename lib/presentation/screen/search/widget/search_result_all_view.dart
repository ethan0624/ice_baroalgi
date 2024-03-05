import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/spot_list_item.dart';

class SearchResultAllView extends StatelessWidget {
  final List<Course> courses;
  final List<Spot> spots;
  final VoidCallback? onCourseMorePressed;
  final VoidCallback? onSpotMorePressed;
  const SearchResultAllView({
    super.key,
    required this.courses,
    required this.spots,
    this.onCourseMorePressed,
    this.onSpotMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return (courses.isEmpty && spots.isEmpty)
        ? Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: Text(
                '검색결과가 없습니다'.tr(),
                style: context.textTheme.bodyMedium,
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              ...courses.take(3).map((e) => CourseListItem(course: e)),
              if (courses.length > 3)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: InkWell(
                      onTap: onCourseMorePressed,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            '더보기'.tr(),
                            style: context.textTheme.bodyMedium,
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (spots.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (courses.isNotEmpty)
                      Container(
                        height: 5,
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        color: AppColor.dividerLight,
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AppTitleText(text: '스팟'.tr()),
                    ),
                    const SizedBox(height: 12),
                    ...spots.take(3).map((e) => SpotListItem(
                          spot: e,
                        )),
                    if (spots.length > 3)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: InkWell(
                            onTap: onSpotMorePressed,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  '더보기'.tr(),
                                  style: context.textTheme.bodyMedium,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
            ],
          );
  }
}
