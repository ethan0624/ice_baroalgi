import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/notice/bloc/notice_bloc.dart';
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
        return Container();
      },
    );
  }
}
