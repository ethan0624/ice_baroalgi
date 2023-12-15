import 'package:auto_route/auto_route.dart';
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
      create: (_) => NoticeBloc(),
      appBar: AppSubAppBar(text: '공지사항'),
      builder: (context, bloc, state) {
        return AccordianListView(
          initialExpanedIndex: 0,
          itemCount: 10,
          titleBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '공지사항 제목',
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
            return Text(
              'contents',
              style: context.textTheme.bodyMedium,
            );
          },
        );
      },
    );
  }
}
