import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/model/push.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/notification/detail/bloc/notification_detail_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/notification/detail/widget/notification_content_header.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/section_divider.dart';

@RoutePage()
class NotificationDetailScreen extends StatefulWidget {
  final Push push;
  const NotificationDetailScreen({super.key, required this.push});

  @override
  State<NotificationDetailScreen> createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<NotificationDetailBloc,
        NotificationDetailBloc, NotificationDetailState>(
      create: (_) => NotificationDetailBloc(push: widget.push)
        ..add(const NotificationDetailEvent.initial()),
      appBar: AppSubAppBar(text: '알림'),
      builder: (context, bloc, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: defaultMarginValue),
          children: [
            const NotificationContentHeader(),
            const SectionDivider(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultMarginValue),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '번역보기',
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\n\n\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
