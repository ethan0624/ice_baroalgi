import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:incheon_knowhow/config/app_theme.dart';
import 'package:incheon_knowhow/presentation/base/base_side_effect_bloc_layout.dart';
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
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  late NaverMapController _mapController;
  NMarker? _selectedMarker;

  Future<NLatLng?> _getCurrentLocation() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) return null;

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return NLatLng(position.latitude, position.longitude);
  }

  _addMarker() async {
    // final current = await _getCurrentLocation();
    // if (current == null) return;

    final current = await _mapController.getCameraPosition();

    print('>>> current : $current');
    final markerIcon = await NOverlayImage.fromWidget(
      widget: CustomMapMarker(),
      size: Size(36, 44),
      context: context,
    );

    final marker = NMarker(
      id: 'test',
      position: current.target.offsetByMeter(northMeter: 100),
      icon: markerIcon,
    );

    final marker2 = NMarker(
      id: 'test2',
      position: current.target.offsetByMeter(northMeter: 100, eastMeter: 100),
      icon: markerIcon,
    );

    final marker3 = NMarker(
      id: 'test3',
      position: current.target.offsetByMeter(northMeter: -100, eastMeter: -100),
      icon: markerIcon,
    );
    marker.setOnTapListener(_onMarkerPressed);
    marker2.setOnTapListener(_onMarkerPressed);
    marker3.setOnTapListener(_onMarkerPressed);

    await _mapController.addOverlayAll({marker, marker2, marker3});
  }

  _onMarkerPressed(NMarker marker) async {
    if (marker == _selectedMarker) return;

    if (_selectedMarker != null) {
      final normalMarker = await NOverlayImage.fromWidget(
        widget: CustomMapMarker(
          type: CustomMapMarkerType.normal,
        ),
        size: Size(36, 44),
        context: context,
      );
      _selectedMarker?.setIcon(normalMarker);
    }
    final markerIcon = await NOverlayImage.fromWidget(
      widget: CustomMapMarker(
        type: CustomMapMarkerType.focus,
      ),
      size: Size(36, 44),
      context: context,
    );
    marker.setIcon(markerIcon);

    setState(() {
      _selectedMarker = marker;
    });
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // todo : show permission alert
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // todo : show permission alert
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // todo : show permission alert

      return false;
    }

    return true;
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
      appBar: CourseAppBar(),
      create: (_) => CourseMapBloc(),
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

                    _addMarker();
                  },
                  onMapTapped: (point, latlng) {
                    print('>>>>>> onMapTapped : $point // $latlng');
                  },
                ),
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: CourseHeader(),
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
                          horizontal: 26, vertical: 26),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(14),
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

                    if (_selectedMarker != null) const SpotCardView(),

                    // bottom
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 26),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: AppButton(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              text: '상세설명',
                              textBold: true,
                              background: Colors.white,
                              textColor: Colors.black,
                              borderColor: AppColor.secondary,
                              onPressed: () =>
                                  context.router.pushNamed('/course/1/info'),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            flex: 4,
                            child: AppButton(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              text: '코스 시작하기',
                              onPressed: () {},
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
