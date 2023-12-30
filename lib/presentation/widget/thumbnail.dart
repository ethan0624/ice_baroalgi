import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Thumbnail extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  const Thumbnail({
    super.key,
    this.imageUrl,
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
        child: imageUrl != null
            ? CachedNetworkImage(
                imageUrl: imageUrl ?? '',
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Container();
                },
              )
            : null,
      ),
    );
  }
}
