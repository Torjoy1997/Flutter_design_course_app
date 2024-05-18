import 'package:flutter/material.dart';
import 'package:programming_course/core/layouts/box_container.dart';
import 'package:shimmer/shimmer.dart';

class ImageShimmerEffect extends StatelessWidget {
  const ImageShimmerEffect(
      {super.key,
      required this.height,
      required this.width,
      this.radius = 15,
      this.color});

  final double height, width, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
        baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
        highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
        child: BoxContainer(
          width: width,
          height: height,
          backGroundColor:
              color ?? (dark ? Colors.grey.shade800 : Colors.white),
          radius: radius,
        ));
  }
}
