import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/config/constrants.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/bloc/stamp_regist_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/widget/poll_item_input_type_view.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/widget/poll_item_multiple_choice_type_view.dart';
import 'package:incheon_knowhow/presentation/screen/stamp_regist/widget/poll_item_radio_type_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_text_form_field.dart';

@RoutePage()
class StampRegistScreen extends StatefulWidget {
  const StampRegistScreen({super.key});

  @override
  State<StampRegistScreen> createState() => _StampRegistScreenState();
}

class _StampRegistScreenState extends State<StampRegistScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isNext = false;

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<StampRegistBloc, StampRegistBloc,
        StampRegistState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(
        text: '정복 스탬프 발행하기'.tr(),
        centerTitle: false,
      ),
      create: (context) => StampRegistBloc(),
      builder: (context, bloc, state) {
        return AnimatedCrossFade(
          duration: AnimationDuration.shortest,
          crossFadeState:
              _isNext ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const PollItemInputTypeView(
                    number: 1,
                    question: '여러분의 활동은 어디에서 이루어졌나요?',
                    hintText: '학교 밖 활동 (마을학교, 진로센터, 현장담방 등)',
                    isRequired: true,
                  ),
                  const PollItemRadioTypeView(
                    number: 2,
                    question: '여러분의 체험은 어떤 종류와 연결되나요?',
                    description:
                        '자신의관심, 흥미에따른활동 : 내신, 진학 등과 관계없이 순수하게 내가 좋아서 한 것, 혹은 취미활동 등을 뜻함 기타 : 예) 부모님의 권유, 종교적 이유, 친구가 하니까, 언젠가는 도움이 될 것 같아서',
                    options: [
                      '학교수업, 혹은 창의적 체험활동과 연계된 활동',
                      '진로를 위해 필요한 교육점수 이수를 위한 활동',
                      '상을 받기 위한 활동',
                      '자격증을 받기 위한 활동',
                      '각종 어학점수를 얻기 위한 활동',
                      '자신의 관심, 흥미에 따른 활동',
                    ],
                  ),
                  const PollItemInputTypeView(
                    number: 3,
                    question: '여러분이 경험한 체험의 제목을 붙여주세요.',
                    hintText: '코스명',
                    isRequired: true,
                  ),
                  const PollItemInputTypeView(
                    number: 4,
                    question: '여러분의 체험은 언제였나요?',
                    hintText: '코스명',
                    isRequired: true,
                  ),
                  const PollItemRadioTypeView(
                    number: 5,
                    question: '체험의 규모는 어떠했나요?',
                    isRequired: true,
                    options: [
                      '혼자 체험',
                      '소규모 체험 (2~15명)',
                      '중규모 체험 (16~30명)',
                      '대규모 체험 (31명 이상)',
                    ],
                  ),
                  const PollItemMultipleChoiceTypeView(
                    number: 6,
                    question: '{코스명} 코스와 관련된 직업 중 관심있는 직업을 선택하세요.',
                    options: ['관련직업', '관련직업1', '관련직업2'],
                    isRequired: true,
                  ),
                  AppButton(
                    text: '다음',
                    onPressed: () {
                      setState(() {
                        _isNext = true;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          secondChild: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        7.toString().padLeft(2, '0'),
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            '6번을 바탕으로 진로체험활동이나 평소 경험한 것\n속에서 내가 좋아하고 관심 있어 하는 직무의 방식을\n서술해 보세요. 이글을 토대로, 미래의 나는 어떤\n일이나 직업을 가지면 좋을지 생각해서 적어보세요,\n직무와 결합해서 새로운 직업을 만들어도 됩니다.\n(아래 예시를 참고하여 작성해 주세요)',
                            style: context.textTheme.bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: AppColor.secondary,
                      ),
                    ),
                    child: Text(
                      '내가 좋아하고 관심 있어 하는 직무 방식',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.secondary.withOpacity(0.3),
                    ),
                    child: const AppTextFormField(
                      margin: EdgeInsets.zero,
                      borderColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      hintText:
                          '• 나는 손재주가 있어 뭔가 직접 만드는 걸 좋아한다.\n• 나는 뭔가 계획 짜는 일을 좋아한다.\n• 나는 가만히 앉아서 문서를 작성하는 것은 싫지만,\n사람을 만나서 이야기 나누는 활동을 좋아한다\n• 나는 사람을 직접 만나 이야기하는 일은 부담스럽\n지만, 온라인에서 하는 채팅은 재미있어한다.\n• 새로운 것을 개발하는 것을 좋아한다.',
                      maxLines: 10,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: AppColor.secondary,
                      ),
                    ),
                    child: Text(
                      '그것과 관련된 직업',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.secondary.withOpacity(0.3),
                    ),
                    child: const AppTextFormField(
                      margin: EdgeInsets.zero,
                      borderColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      hintText: '화가, 데이점 디자이너, 헤어 디자이너, 건축가, 요리사, 피아니스트 등',
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: AppColor.secondary,
                      ),
                    ),
                    child: Text(
                      '그 중 내가 가장 관심 있는 직업',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.secondary.withOpacity(0.3),
                    ),
                    child: const AppTextFormField(
                      margin: EdgeInsets.zero,
                      borderColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      hintText: '요리사',
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: AppColor.secondary,
                      ),
                    ),
                    child: Text(
                      '내가 꿈꾸는 삶과 직업에 대한 가치관',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.secondary.withOpacity(0.3),
                    ),
                    child: const AppTextFormField(
                      margin: EdgeInsets.zero,
                      borderColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      hintText:
                          '※ 내가 직업을 가졌을 때의 삶과 그 직업에 대한 가치관, 영향력 등 종합적으로 적기\n\n요리사는 음식을 먹음직스럽고 맛있게 만드는 일을 한다. 사람들이 살아가는데 꼭 필요한 음식을 제공해주는 직업이다.\n\n멋진 요리사가 되기 위해 내가 가장 잘할 수 있는 요리 분야를 정해는 것이 좋을 거 같다. 먼저 우리나라뿐 아니라 세계 여러 나라 사람들이 좋아하는 음식에 대해 연구한 후 다양한 메뉴 개발을 할 수 있는 분야로 정할 것이다. 음식의 재료를 손질하는 방법, 익히는 방법, 음식의 궁합, 건강에 맞는 음식 조사 등 다양한 공부도 필요할 것이다. 또 요리자격증을 취득하기 위해 요리의 이론과 실습 과정을 배우고 익힐 것이다. 또 요리를 하는데는 체력도 필요하기 때문에 계획을 세워 매일 운동을 할 것이다.',
                      maxLines: 18,
                    ),
                  ),
                  AppButton(
                    text: '스탬프 발행하기',
                    onPressed: () {
                      setState(() {
                        _isNext = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
