import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/screen/cscenter/inquiry/bloc/inquiry_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/cscenter/inquiry/widget/inquiry_form.dart';
import 'package:incheon_knowhow/presentation/screen/cscenter/inquiry/widget/inquiry_list_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:provider/provider.dart';

@RoutePage()
class InquiryScreen extends StatefulWidget {
  const InquiryScreen({super.key});

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _onInquirySubmit(InqueryFormData data) {
    final bloc = _scaffoldKey.currentContext?.read<InquiryBloc>();
    if (bloc == null) return;

    bloc.add(InquiryEvent.request(
      title: data.title,
      content: data.question,
      files: data.files ?? [],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<InquiryBloc, InquiryBloc, InquiryState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '1:1문의'.tr()),
      create: (_) => InquiryBloc()..add(const InquiryEvent.initial()),
      effectChanged: (context, effect) {
        if (effect is SuccessEffect) {
          context.showAlert(title: '정상적으로 처리되었습니다');
        }
      },
      builder: (context, bloc, state) {
        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                padding: const EdgeInsets.all(defaultMarginValue),
                splashFactory: NoSplash.splashFactory,
                // indicator: const BoxDecoration(
                //   color: Color(0xffffedf3),
                // ),
                labelColor: AppColor.primary,
                labelStyle: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: AppTextColor.medium,
                unselectedLabelStyle: context.textTheme.bodyMedium,
                dividerHeight: 0,
                tabs: [
                  Tab(text: '문의하기'.tr()),
                  Tab(text: '문의내역'.tr()),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    InquiryForm(
                      onSubmit: _onInquirySubmit,
                    ),
                    InquiryListView(
                      items: state.qnaItems,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
