import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/notification/list/bloc/notification_list_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/notification/list/widget/notification_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';

@RoutePage()
class NotificationListScreen extends StatefulWidget {
  const NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<NotificationListBloc, NotificationListBloc,
        NotificationListState>(
      create: (_) => NotificationListBloc(),
      appBar: AppSubAppBar(text: '알림'),
      builder: (context, bloc, state) {
        return ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) {
            return NotificationListItem(
              isNew: index % 3 == 0,
              onPressed: () {
                context.router.pushNamed('/notification/1');
              },
            );
          },
          separatorBuilder: (context, index) {
            return Container(height: 1, color: AppColor.dividerLight);
          },
        );
      },
    );
  }
}
