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

class _InquiryScreenState extends State<InquiryScreen>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _inquiryFormKey = GlobalKey<InquiryFormState>();
  late TabController _tabController;

  _onInquirySubmit(InqueryFormData data) {
    FocusManager.instance.primaryFocus?.unfocus();

    final bloc = _scaffoldKey.currentContext?.read<InquiryBloc>();
    if (bloc == null) return;

    bloc.add(InquiryEvent.request(
      title: data.title,
      content: data.question,
      files: data.files ?? [],
    ));
  }

  _onInquirySuccess() {
    context.showAlert(title: '정상적으로 처리되었습니다');
    final bloc = _scaffoldKey.currentContext?.read<InquiryBloc>();
    if (bloc == null) return;

    _inquiryFormKey.currentState?.onClear();

    bloc.add(const InquiryEvent.refresh());

    _tabController.animateTo(1);
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<InquiryBloc, InquiryBloc, InquiryState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: '1:1문의'.tr()),
      create: (_) => InquiryBloc()..add(const InquiryEvent.initial()),
      effectChanged: (context, effect) {
        if (effect is SuccessEffect) {
          _onInquirySuccess();
        }
      },
      builder: (context, bloc, state) {
        return Column(
          children: [
            TabBar(
              controller: _tabController,
              padding: const EdgeInsets.all(defaultMarginValue),
              splashFactory: NoSplash.splashFactory,
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
                controller: _tabController,
                children: [
                  InquiryForm(
                    key: _inquiryFormKey,
                    onSubmit: _onInquirySubmit,
                  ),
                  InquiryListView(
                    items: state.qnaItems,
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
