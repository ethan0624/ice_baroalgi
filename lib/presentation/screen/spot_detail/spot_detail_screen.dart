import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/spot_detail/bloc/spot_detail_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/image_slider.dart';

@RoutePage()
class SpotDetailScreen extends StatefulWidget {
  const SpotDetailScreen({super.key});

  @override
  State<SpotDetailScreen> createState() => _SpotDetailScreenState();
}

class _SpotDetailScreenState extends State<SpotDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<SpotDetailBloc, SpotDetailBloc,
        SpotDetailState>(
      appBar: AppSubAppBar(
        text: '주안역 뒷역',
        centerTitle: false,
      ),
      create: (_) => SpotDetailBloc(),
      builder: (context, bloc, state) {
        return Stack(
          children: [
            Positioned.fill(
              bottom: 70,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultMarginValue),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultMarginValue),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTitleText(text: '주안역 뒷역'),
                        const ImageSlider(
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        Text(
                          '간단한 코스에 대한 설명이 작성됩니다.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                          style: context.textTheme.bodySmall,
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: const Size(10, 10),
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {},
                            child: Text(
                              '번역보기',
                              style: context.textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: defaultMarginValue),
                    height: 6,
                    color: AppColor.dividerLight,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultMarginValue),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTitleText(text: '기본정보'),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          height: 175,
                          child: NaverMap(
                            options: const NaverMapViewOptions(),
                            onMapReady: (controller) {},
                            onMapTapped: (point, latlng) {},
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 12),
                          decoration: BoxDecoration(
                              color: AppColor.background,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 88,
                                    child: Text(
                                      '주소',
                                      style: context.textTheme.labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '인천광역시 미추홀구 주안로 95-19',
                                      style: context.textTheme.labelLarge
                                          ?.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 88,
                                    child: Text(
                                      '전화번호',
                                      style: context.textTheme.labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '032-1234-1234',
                                      style: context.textTheme.labelLarge
                                          ?.copyWith(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 88,
                                    child: Text(
                                      '운영시간',
                                      style: context.textTheme.labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '오전 10시부터 오후 4시',
                                      style: context.textTheme.labelLarge,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 88,
                                    child: Text(
                                      '휴무일',
                                      style: context.textTheme.labelLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '매주 월요일',
                                      style: context.textTheme.labelLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: defaultMarginValue),
                    height: 6,
                    color: AppColor.dividerLight,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultMarginValue),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppTitleText(text: '포함하는 코스'),
                        const SizedBox(height: 6),
                        ...List.generate(
                          3,
                          (index) => const CourseListItem(
                            margin: EdgeInsets.symmetric(vertical: 6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultMarginValue, vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: AppButton(
                  text: '깃발 등록하기',
                  textBold: true,
                  padding: const EdgeInsets.all(10),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
