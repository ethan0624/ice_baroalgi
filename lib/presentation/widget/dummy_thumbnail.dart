import 'package:flutter/material.dart';

class DummyThumbnail extends StatelessWidget {
  final String assetPath;
  final double width;
  final double height;

  const DummyThumbnail({
    super.key,
    required this.assetPath,
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
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          errorBuilder: (context, _, error) {
            return Container();
          },
        ),
      ),
    );
  }
}
