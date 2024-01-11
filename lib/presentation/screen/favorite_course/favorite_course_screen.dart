import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/core/extension/int_extension.dart';
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
      appBar: AppSubAppBar(text: '찜한코스'.tr()),
      create: (_) =>
          FavoriteCourseBloc()..add(const FavoriteCourseEvent.initial()),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultMarginValue, vertical: 12),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '총 코스'.tr(namedArgs: {
                    'total': state.favoriteCourse.length.toNumberFormat
                  }),
                  style: context.textTheme.labelMedium?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const AppCheckbox(),
                    Text(
                      '완료코스 숨김'.tr(),
                      style: context.textTheme.labelMedium?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ],
            ),
            if (state.favoriteCourse.isEmpty)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 60),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '찜한 코스가 없습니다'.tr(),
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ...state.favoriteCourse.map(
              (e) => CourseListItem(
                margin: const EdgeInsets.symmetric(vertical: 6),
                course: e,
              ),
            ),
          ],
        );
      },
    );
  }
}
