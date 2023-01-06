import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key key,
    this.imageUrl,
    this.height,
  }) : super(key: key);

  final String imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey[400],
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Center(
          child: Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}
