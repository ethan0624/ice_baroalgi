import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/screen/spot_detail/bloc/spot_detail_bloc.dart';
import 'package:incheon_knowhow/presentation/screen/spot_detail/widget/info_item_view.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/app_sub_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/app_title_text.dart';
import 'package:incheon_knowhow/presentation/widget/course_list_item.dart';
import 'package:incheon_knowhow/presentation/widget/custom_map_marker.dart';
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
                              if (state.spot?.images?.isNotEmpty == true)
                                ImageSlider(
                                  images: state.spot?.images ?? [],
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                ),
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
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: NaverMap(
                                    options: const NaverMapViewOptions(),
                                    onMapReady: (controller) async {
                                      if (state.spot!.latitude == null ||
                                          state.spot!.longitude == null) return;

                                      final position = NLatLng(
                                          state.spot!.latitude!,
                                          state.spot!.longitude!);

                                      final markerIcon =
                                          await NOverlayImage.fromWidget(
                                        widget: const CustomMapMarker(
                                          type: CustomMapMarkerType.normal,
                                          isFocus: true,
                                        ),
                                        size: const Size(36, 44),
                                        context: context,
                                      );

                                      final marker = NMarker(
                                        id: 'maker-spot-${state.spot?.id}',
                                        position: NLatLng(state.spot!.latitude!,
                                            state.spot!.longitude!),
                                        icon: markerIcon,
                                        size: const Size(36, 44),
                                      );

                                      await controller.addOverlayAll({marker});

                                      controller.updateCamera(
                                          NCameraUpdate.withParams(
                                              target: position));
                                    },
                                  ),
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
                                    InfoItemView(
                                      label: '주소',
                                      value: state.spot?.address ?? '',
                                    ),
                                    const SizedBox(height: 12),
                                    InfoItemView(
                                      label: '전화번호',
                                      value: state.spot?.tel ?? '',
                                    ),
                                    const SizedBox(height: 12),
                                    InfoItemView(
                                      label: '운영시간',
                                      value: state.spot?.openTime
                                              ?.replaceAll('/n', '\n') ??
                                          '',
                                    ),
                                    const SizedBox(height: 12),
                                    InfoItemView(
                                      label: '휴무일',
                                      value: state.spot?.dayOff
                                              ?.replaceAll('/n', '\n') ??
                                          '',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (state.includeCourse.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: defaultMarginValue),
                            height: 6,
                            color: AppColor.dividerLight,
                          ),
                        if (state.includeCourse.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultMarginValue),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const AppTitleText(text: '포함하는 코스'),
                                const SizedBox(height: 6),
                                ...state.includeCourse
                                    .map((e) => CourseListItem(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          course: e,
                                        )),
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
