import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<CscenterQnaBloc, CscenterQnaBloc,
        CscenterQnaState>(
      appBar: AppSubAppBar(
        text: 'QnA',
      ),
      create: (_) => CscenterQnaBloc(),
      builder: (context, bloc, state) {
        return Stack(
          children: [
            Positioned.fill(
              bottom: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(26),
                    child: AppTitleText(text: '자주묻는질문'),
                  ),
                  SizedBox(
                    height: 32,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
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
                  const SizedBox(height: 14),
                  Expanded(
                    child: AccordianListView(
                      itemCount: 30,
                      titleBuilder: (context, index) {
                        return const Text('자주묻는 질문 제목이 작성됩니다.');
                      },
                      contentBuilder: (context, index) {
                        return const Text('자주묻는 질문 내용이 작성됩니다.');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 26,
              left: 26,
              right: 26,
              child: AppButton(
                text: '문의작성하기',
                onPressed: () {},
              ),
            ),
          ],
        );
      },
    );
  }
}
