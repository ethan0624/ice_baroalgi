import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/bloc/stamp_regist_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';

@RoutePage()
class StampRegistScreen extends StatefulWidget {
  const StampRegistScreen({super.key});

  @override
  State<StampRegistScreen> createState() => _StampRegistScreenState();
}

class _StampRegistScreenState extends State<StampRegistScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<StampRegistBloc, StampRegistBloc,
        StampRegistState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '정복 스탬프 발행하기'),
      create: (context) => StampRegistBloc(),
      builder: (context, bloc, state) {
        return Container();
      },
    );
  }
}
