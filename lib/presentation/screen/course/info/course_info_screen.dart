import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/course/info/bloc/course_info_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/course_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/course_header.dart';
import 'package:incheon_knowhow/presentation/widget/spot_list_item.dart';

@RoutePage()
class CourseInfoScreen extends StatefulWidget {
  final int courseId;
  const CourseInfoScreen({super.key, @pathParam required this.courseId});

  @override
  State<CourseInfoScreen> createState() => _CourseInfoScreenState();
}

class _CourseInfoScreenState extends State<CourseInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<CourseInfoBloc, CourseInfoBloc,
        CourseInfoState>(
      appBar: CourseAppBar(
        text: '민주주의의 길',
      ),
      create: (_) => CourseInfoBloc(),
      builder: (context, bloc, state) {
        return Stack(
          children: [
            Positioned.fill(
              bottom: 75,
              child: ListView(
                children: [
                  const CourseHeader(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CarouselSlider.builder(
                            itemCount: 5,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: index % 2 == 0
                                      ? Colors.grey
                                      : Colors.blue,
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 185,
                              viewportFraction: 1,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5,
                              (index) => Container(
                                width: 6,
                                height: 6,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      index == 0 ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 14),
                    child: Text(
                      '간단한 코스에 대한 설명이 작성됩니다.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                      style: context.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Align(
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
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 26),
                    height: 6,
                    color: AppColor.dividerLight,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    child: AppTitleText(text: '스팟 리스트'),
                  ),
                  ...List.generate(5, (index) => const SpotListItem()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
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
                  text: '코스 시작하기',
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
