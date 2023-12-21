import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/my_course/bloc/my_course_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/my_course/widget/my_course_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';

@RoutePage()
class MyCourseScreen extends StatefulWidget {
  const MyCourseScreen({super.key});

  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<MyCourseBloc, MyCourseBloc, MyCourseState>(
      appBar: MyCourseAppBar(
        onFavoritePressed: () {
          context.router.pushNamed('/favoriteCourse');
        },
      ),
      create: (_) => MyCourseBloc(),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultMarginValue, vertical: 12),
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: defaultMarginValue),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.secondaryBackground,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColor.primary,
                    child: const Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '정복코스추가하기',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '새로운 코스를 찾아보세요.',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppTextColor.medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const AppTitleText(text: '정복중인 코스'),
            const SizedBox(height: 6),
            ...List.generate(
                3,
                (index) => CourseListItem(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      course: Course.mock(),
                    )),
            const SizedBox(height: defaultMarginValue),
            const AppTitleText(text: '완료코스'),
            const SizedBox(height: 6),
            ...List.generate(
                10,
                (index) => CourseListItem(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      course: Course.mock(),
                    )),
          ],
        );
      },
    );
  }
}
