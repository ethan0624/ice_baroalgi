import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/favorite_course/bloc/favorite_course_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_checkbox.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';

@RoutePage()
class FavoriteCourseScreen extends StatefulWidget {
  const FavoriteCourseScreen({super.key});

  @override
  State<FavoriteCourseScreen> createState() => _FavoriteCourseScreenState();
}

class _FavoriteCourseScreenState extends State<FavoriteCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<FavoriteCourseBloc, FavoriteCourseBloc,
        FavoriteCourseState>(
      appBar: AppSubAppBar(text: '짬한코스'),
      create: (_) => FavoriteCourseBloc(),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
          children: [
            Row(
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
            ...List.generate(
                30,
                (index) => const CourseListItem(
                      margin: EdgeInsets.symmetric(vertical: 12),
                    )),
          ],
        );
      },
    );
  }
}
