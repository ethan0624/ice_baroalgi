import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum CustomMapMarkerType { normal, completed }

extension CustomMapMarkerTypeExtension on CustomMapMarkerType {
  String get iconPath {
    switch (this) {
      case CustomMapMarkerType.normal:
        return 'assets/images/ic_map_marker.svg';
      case CustomMapMarkerType.completed:
        return 'assets/images/ic_flag_off.svg';
    }
  }

  String get focusIconPath {
    switch (this) {
      case CustomMapMarkerType.normal:
        return 'assets/images/ic_map_marker_on.svg';
      case CustomMapMarkerType.completed:
        return 'assets/images/ic_flag_on.svg';
    }
  }
}

class CustomMapMarker extends StatelessWidget {
  final CustomMapMarkerType type;
  final bool isFocus;
  final double width;
  final double height;

  const CustomMapMarker({
    super.key,
    this.type = CustomMapMarkerType.normal,
    this.isFocus = false,
    this.width = 36,
    this.height = 44,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        isFocus ? type.focusIconPath : type.iconPath,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
