import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/cscenter/qna/bloc/cscenter_qna_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/accordian_list_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/filter_button.dart';

@RoutePage()
class CscenterQnaScreen extends StatefulWidget {
  const CscenterQnaScreen({super.key});

  @override
  State<CscenterQnaScreen> createState() => _CscenterQnaScreenState();
}

class _CscenterQnaScreenState extends State<CscenterQnaScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<CscenterQnaBloc, CscenterQnaBloc,
        CscenterQnaState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(text: 'QnA'),
      create: (_) => CscenterQnaBloc()..add(const CscenterQnaEvent.initial()),
      builder: (context, bloc, state) {
        return Stack(
          children: [
            Positioned.fill(
              bottom: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(defaultMarginValue),
                    child: AppTitleText(text: '자주묻는질문'),
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultMarginValue),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return FilterButton(
                          text: '카테고리 $index',
                          isSelected: index == 0,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 8);
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (!state.isLoading)
                    (state.faqList.isEmpty)
                        ? Center(
                            child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 60),
                            child: Text(
                              '등록된 자주묻는 질문이 없습니다',
                              style: context.textTheme.bodyMedium,
                            ),
                          ))
                        : Expanded(
                            child: AccordianListView(
                              itemCount: state.faqList.length,
                              titleBuilder: (context, index) {
                                final faq = state.faqList[index];
                                return Text(
                                  faq.question,
                                  style: context.textTheme.bodyMedium,
                                );
                              },
                              contentBuilder: (context, index) {
                                final faq = state.faqList[index];
                                return Text(
                                  faq.answer,
                                  style: context.textTheme.bodyMedium,
                                );
                              },
                            ),
                          ),
                ],
              ),
            ),
            Positioned(
              bottom: defaultMarginValue,
              left: defaultMarginValue,
              right: defaultMarginValue,
              child: AppButton(
                text: '문의작성하기',
                onPressed: () => context.router.pushNamed('/cscenter/inquiry'),
              ),
            ),
          ],
        );
      },
    );
  }
}
