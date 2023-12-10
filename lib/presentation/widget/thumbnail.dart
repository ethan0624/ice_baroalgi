import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final double width;
  final double height;
  const Thumbnail({
    super.key,
    this.width = 100,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: width,
        height: height,
        color: Colors.grey.shade200,
      ),
    );
  }
}
