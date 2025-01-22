import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class CachedImage extends StatelessWidget {
  final BoxFit fit;
  final double height;
  final double width;

  const CachedImage({
    super.key,
    required this.fit,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://i.ibb.co/FwTPCCc/Ultra-Linx.jpg",
      fit: fit,
      // height: height,
      width: width,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
