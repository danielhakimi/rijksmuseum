import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
    this.objectNumber,
    this.imageUrl,
    this.height,
    this.width,
  });

  final String? objectNumber;
  final String? imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) => Hero(
        tag: objectNumber ?? '',
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? '',
          height: height ?? (MediaQuery.of(context).size.height * 0.5),
          width: width,
          memCacheHeight: (MediaQuery.of(context).size.height * 0.7).toInt(),
          fit: BoxFit.cover,
        ),
      );
}
