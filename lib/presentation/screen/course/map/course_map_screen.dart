// ignore_for_file: use_build_context_synchronously
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:geolocator/geolocator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/core/extension/context_extension.dart';
import 'package:incheon_knowhow/domain/enum/course_state_type.dart';
import 'package:incheon_knowhow/domain/model/course.dart';
import 'package:incheon_knowhow/domain/model/spot.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
import 'package:incheon_knowhow/presentation/base/bloc_effect.dart';
import 'package:incheon_knowhow/presentation/dialog/course_stamp_dialog.dart';
import 'package:incheon_knowhow/presentation/dialog/spot_flag_completed_dialog.dart';
import 'package:incheon_knowhow/presentation/dialog/spot_flag_dialog.dart';
import 'package:incheon_knowhow/presentation/screen/course/map/bloc/course_map_bloc.dart';
import 'package:incheon_knowhow/presentation/widget/app_button.dart';
import 'package:incheon_knowhow/presentation/widget/course_app_bar.dart';
import 'package:incheon_knowhow/presentation/widget/course_header.dart';
import 'package:incheon_knowhow/presentation/widget/custom_map_marker.dart';
import 'package:incheon_knowhow/presentation/widget/spot_card_view.dart';

@RoutePage()
class CourseMapScreen extends StatefulWidget {
  final int courseId;
  const CourseMapScreen({super.key, @pathParam required this.courseId});

  @override
  State<CourseMapScreen> createState() => _CourseMapScreenState();
}

class _CourseMapScreenState extends State<CourseMapScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  late NaverMapController _mapController;

  NMarker? _selectedMarker;

  String _title = '';
  bool _isFavorite = false;
  final List<Spot> _visibleMarkerSpots = [];

  _onFavoritePressed() {
    context.checkLoginOrRequestLogin(onLoggedIn: () {
      final bloc = _scaffoldKey.currentContext?.read<CourseMapBloc>();
      if (bloc == null) return;

      bloc.add(const CourseMapEvent.toggleFavorite());
    });
  }

  _onSharedPressed() async {
    if (_title.isNotEmpty) {
      context.share(title: _title);
    }
  }

  _handleStateChanged(CourseMapState state) {
    final course = state.course;
    if (course != null) {
      setState(() {
        _title = course.title;
        _isFavorite = course.isLiked;
      });
    }

    if (state.spots.isNotEmpty && !_visibleMarkerSpots.equals(state.spots)) {
      _addSpotMarkers(state.spots);
    }
  }

  Future<NLatLng?> _getCurrentLocation() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) return null;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return NLatLng(position.latitude, position.longitude);
  }

  _searchingCurrentLocation() async {
    final location = await _getCurrentLocation();
    if (location == null) return;

    _mapController.updateCamera(NCameraUpdate.withParams(target: location));
  }

  _addSpotMarkers(List<Spot> spots) async {
    final current = await _getCurrentLocation();

    final markerIcon = await NOverlayImage.fromWidget(
      widget: const CustomMapMarker(),
      size: const Size(36, 44),
      context: context,
    );
    final completeSpotIcon = await NOverlayImage.fromWidget(
      widget: const CustomMapMarker(type: CustomMapMarkerType.completed),
      size: const Size(36, 44),
      context: context,
    );
    final makers =
        spots.where((e) => e.latitude != null && e.longitude != null).map((e) {
      final latlng = NLatLng(e.latitude!, e.longitude!);
      final marker = NMarker(
        id: e.isFlag
            ? 'maker-spot-complete-${e.id}'
            : 'maker-spot-normal-${e.id}',
        position: latlng,
        icon: e.isFlag ? completeSpotIcon : markerIcon,
        size: const Size(36, 44),
      );
      marker.setOnTapListener(_onMarkerPressed);
      return marker;
    });

    await _mapController.clearOverlays();
    await _mapController.addOverlayAll(makers.toSet());

    if (_visibleMarkerSpots.isEmpty) {
      // final position =
      //     current ?? NLatLng(spots.first.latitude!, spots.first.longitude!);
      final position = NLatLng(spots.first.latitude!, spots.first.longitude!);
      _mapController.updateCamera(NCameraUpdate.withParams(target: position));
    }
    _visibleMarkerSpots.clear();
    _visibleMarkerSpots.addAll(spots);
  }

  _focusClearMaker() async {
    if (_selectedMarker != null) {
      final isCompleteType =
          _selectedMarker?.info.id.contains('complete') ?? false;
      final customMarker = await NOverlayImage.fromWidget(
        widget: CustomMapMarker(
            type: isCompleteType
                ? CustomMapMarkerType.completed
                : CustomMapMarkerType.normal),
        size: const Size(36, 44),
        context: context,
      );

      _selectedMarker?.setIcon(customMarker);
      setState(() {
        _selectedMarker = null;
      });
    }
  }

  _onMarkerPressed(NMarker marker) async {
    if (_selectedMarker != null) {
      final isCompleteType =
          _selectedMarker?.info.id.contains('complete') ?? false;
      final customMarker = await NOverlayImage.fromWidget(
        widget: CustomMapMarker(
            type: isCompleteType
                ? CustomMapMarkerType.completed
                : CustomMapMarkerType.normal),
        size: const Size(36, 44),
        context: context,
      );

      _selectedMarker?.setIcon(customMarker);
      _selectedMarker = null;
    }

    final isCompleteType = marker.info.id.contains('complete');
    final customMarker = await NOverlayImage.fromWidget(
      widget: CustomMapMarker(
        type: isCompleteType
            ? CustomMapMarkerType.completed
            : CustomMapMarkerType.normal,
        isFocus: true,
      ),
      size: const Size(36, 44),
      context: context,
    );
    _selectedMarker = marker;
    _selectedMarker?.setIcon(customMarker);

    setState(() {
      _selectedMarker = marker;
    });

    final bloc = _scaffoldKey.currentContext?.read<CourseMapBloc>();
    if (bloc == null) return;

    final spotId = marker.info.id.split('-').last;
    bloc.add(CourseMapEvent.selected(int.parse(spotId)));
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  _startCourse() {
    context.checkLoginOrRequestLogin(onLoggedIn: () {
      final bloc = _scaffoldKey.currentContext?.read<CourseMapBloc>();
      if (bloc == null) return;

      bloc.add(const CourseMapEvent.start());
    });
  }

  _cancelCourse() {
    context.checkLoginOrRequestLogin(onLoggedIn: () async {
      final ret = await context.showConfirm(
          title: '정복을 중단하시겠습니까'.tr(),
          message: '진행중인 코스 리스트에서 삭제되어집니다 진행하시겠습니까'.tr());
      if (ret == null || ret == false) return;

      final bloc = _scaffoldKey.currentContext?.read<CourseMapBloc>();
      if (bloc == null) return;

      bloc.add(const CourseMapEvent.cancel());
    });
  }

  _requestStamp(Course course) async {
    context.checkLoginOrRequestLogin(onLoggedIn: () async {
      final ret =
          await CourseStampDialog.show(context, courseName: course.title);
      if (ret == null || ret == false) return;

      _showStampPoll();
    });
  }

  _showStampPoll() async {
    final ret = await context.router.pushNamed('/stamp/regist');
    if (ret == null || ret == false) return;

    context.router.navigateNamed('/main/home');
  }

  _onSpotFlagRegist(Spot spot) {
    context.checkLoginOrRequestLogin(onLoggedIn: () async {
      final ret = await SpotFlagDialog.show(context, spotName: spot.title);
      if (ret == null || ret == false) return;

      final bloc = _scaffoldKey.currentContext?.read<CourseMapBloc>();
      if (bloc == null) return;

      bloc.add(CourseMapEvent.registFlag(spot.id));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mapController.clearOverlays();
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseSideEffectBlocLayout<CourseMapBloc, CourseMapBloc,
        CourseMapState>(
      scaffoldKey: _scaffoldKey,
      appBar: CourseAppBar(
        isFavorited: _isFavorite,
        onFavoritePressed: _onFavoritePressed,
        onSharedPressed: _onSharedPressed,
      ),
      create: (_) => CourseMapBloc(courseId: widget.courseId)
        ..add(const CourseMapEvent.initial()),
      stateChanged: (context, state) {
        _handleStateChanged(state);
      },
      effectChanged: (context, effect) {
        if (effect is SuccessEffect) {
          _focusClearMaker();
          SpotFlagCompletedDialog.show(context);
        }
      },
      builder: (context, bloc, state) {
        return SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: NaverMap(
                  options: const NaverMapViewOptions(),
                  onMapReady: (controller) {
                    _mapController = controller;
                    _mapController.setLocationTrackingMode(
                        NLocationTrackingMode.noFollow);
                  },
                  onMapTapped: (point, latlng) {
                    _focusClearMaker();
                  },
                ),
              ),
              if (state.course != null)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CourseHeader(
                    course: state.course!,
                  ),
                ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    // button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultMarginValue,
                          vertical: defaultMarginValue),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: _searchingCurrentLocation,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.location_searching,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    if (_selectedMarker != null && state.selectedSpot != null)
                      SpotCardView(
                        spot: state.selectedSpot!,
                        enabledRegistButton:
                            state.course?.state == CourseStateType.inProgress,
                        onRegistPressed: _onSpotFlagRegist,
                      ),

                    // bottom
                    if (state.course != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: defaultMarginValue),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: const Offset(0, -6),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: AppButton(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                text: '상세설명'.tr(),
                                textBold: true,
                                background: Colors.white,
                                textColor: Colors.black,
                                borderColor: AppColor.secondary,
                                onPressed: () => context.router.pushNamed(
                                    '/course/${widget.courseId}/info'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            if (state.course?.state ==
                                CourseStateType.completed)
                              Expanded(
                                flex: 4,
                                child: AppButton(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  text: '정복완료'.tr(),
                                ),
                              ),
                            if (state.course?.state ==
                                CourseStateType.stampReady)
                              Expanded(
                                flex: 4,
                                child: AppButton(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  text: '정복완료'.tr(),
                                  onPressed: () => _requestStamp(state.course!),
                                ),
                              ),
                            if (state.course?.state ==
                                CourseStateType.inProgress)
                              Expanded(
                                flex: 4,
                                child: AppButton(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  text: '정복중'.tr(),
                                  onPressed: _cancelCourse,
                                ),
                              ),
                            if (state.course?.state == CourseStateType.ready)
                              Expanded(
                                flex: 4,
                                child: AppButton(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  text: '코스 시작하기'.tr(),
                                  onPressed: _startCourse,
                                ),
                              ),
                          ],
                        ),
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
