import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  const ProgressBar({
    super.key,
    this.value = 0,
    this.height = 18,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.progressColor = const Color(0xFFFDACC7),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: value,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: progressColor,
          ),
        ),
      ),
    );
  }
}
