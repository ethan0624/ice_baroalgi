import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/user_gender_type.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/spot_detail/bloc/spot_detail_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/image_slider.dart';

@RoutePage()
class SpotDetailScreen extends StatefulWidget {
  final int spotId;
  const SpotDetailScreen({super.key, @pathParam required this.spotId});

  @override
  State<SpotDetailScreen> createState() => _SpotDetailScreenState();
}

class _SpotDetailScreenState extends State<SpotDetailScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _title = '';

  _handleStateChanged(SpotDetailState state) {
    if (state.spot != null) {
      setState(() {
        _title = state.spot?.title ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<SpotDetailBloc, SpotDetailBloc,
        SpotDetailState>(
      scaffoldKey: _scaffoldKey,
      appBar: AppSubAppBar(
        text: _title,
        centerTitle: false,
      ),
      create: (_) => SpotDetailBloc(spotId: widget.spotId)
        ..add(const SpotDetailEvent.initial()),
      stateChanged: (context, state) {
        _handleStateChanged(state);
      },
      builder: (context, bloc, state) {
        return (state.spot == null)
            ? Container()
            : Stack(
                children: [
                  Positioned.fill(
                    bottom: 70,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultMarginValue),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultMarginValue),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTitleText(text: state.spot?.title ?? ''),
                              // const ImageSlider(
                              //   padding: EdgeInsets.symmetric(vertical: 12),
                              // ),
                              Text(
                                state.spot?.description ?? '',
                                style: context.textTheme.bodySmall,
                              ),
                              const SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    minimumSize: const Size(10, 10),
                                    padding: EdgeInsets.zero,
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 12),
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${state.spot?.address ?? ''} ${state.spot?.detailAddress ?? ''}',
                                            style: context.textTheme.labelLarge
                                                ?.copyWith(
                                              decoration:
                                                  TextDecoration.underline,
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            state.spot?.tel ?? '',
                                            style: context.textTheme.labelLarge
                                                ?.copyWith(
                                              decoration:
                                                  TextDecoration.underline,
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            state.spot?.openTime ?? '',
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
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            state.spot?.dayOff ?? '',
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
                              // ...List.generate(
                              //   3,
                              //   (index) => CourseListItem(
                              //     margin: const EdgeInsets.symmetric(vertical: 6),
                              //     course: Course.mock(),
                              //   ),
                              // ),
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
                              color: Colors.black12,
                              blurRadius: 12,
                              offset: Offset(0, -12)),
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
