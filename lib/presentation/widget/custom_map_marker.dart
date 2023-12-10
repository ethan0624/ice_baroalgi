import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum CustomMapMarkerType { normal, focus, completed }

extension CustomMapMarkerTypeExtension on CustomMapMarkerType {
  String get iconPath {
    switch (this) {
      case CustomMapMarkerType.normal:
        return 'assets/images/ic_map_marker.svg';
      case CustomMapMarkerType.focus:
        return 'assets/images/ic_map_marker_on.svg';
      case CustomMapMarkerType.completed:
        return 'assets/images/ic_map_marker_on.svg';
    }
  }
}

class CustomMapMarker extends StatelessWidget {
  final CustomMapMarkerType type;
  final double width;
  final double height;
  const CustomMapMarker({
    super.key,
    this.type = CustomMapMarkerType.normal,
    this.width = 36,
    this.height = 44,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        type.iconPath,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
