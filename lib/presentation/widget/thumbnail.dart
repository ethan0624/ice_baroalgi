import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final double width;
  final double height;
  const Thumbnail({
    super.key,
    this.width = 90,
    this.height = 90,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: width,
        height: height,
        color: Colors.grey.shade200,
      ),
    );
  }
}
