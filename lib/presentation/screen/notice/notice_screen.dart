import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/notice/bloc/notice_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/accordian_list_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';

@RoutePage()
class NoticeScreen extends StatefulWidget {
  const NoticeScreen({super.key});

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<NoticeBloc, NoticeBloc, NoticeState>(
      create: (_) => NoticeBloc()..add(const NoticeEvent.initial()),
      appBar: AppSubAppBar(text: '공지사항'.tr()),
      builder: (context, bloc, state) {
        if (state.isLoading) {
          return const SizedBox();
        } else if (state.notices.isEmpty) {
          return Center(
              child: Text(
            '등록된 공지사항이 없습니다'.tr(),
            style: context.textTheme.bodyMedium,
          ));
        }
        return AccordianListView(
          initialExpanedIndex: 0,
          itemCount: state.notices.length,
          titleBuilder: (context, index) {
            final notice = state.notices[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notice.title,
                    style: context.textTheme.bodyMedium,
                  ),
                  Text(
                    '2023.12.09',
                    style: context.textTheme.labelMedium
                        ?.copyWith(color: AppTextColor.medium),
                  ),
                ],
              ),
            );
          },
          contentBuilder: (context, index) {
            final notice = state.notices[index];
            return Text(
              notice.content ?? '',
              style: context.textTheme.bodyMedium,
            );
          },
        );
      },
    );
  }
}
