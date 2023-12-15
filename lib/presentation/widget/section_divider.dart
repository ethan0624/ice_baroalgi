import 'package:flutter/material.dart';
import 'package:incheon_knowhow/config/app_theme.dart';

class SectionDivider extends StatelessWidget {
  final double height;
  final EdgeInsets margin;
  final Color? color;
  const SectionDivider({
    super.key,
    this.height = 6,
    this.margin = const EdgeInsets.symmetric(vertical: 12),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: color ?? AppColor.dividerLight,
      margin: margin,
    );
  }
}
