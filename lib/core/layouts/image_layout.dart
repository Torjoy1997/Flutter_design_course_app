import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:programming_course/core/layouts/shimmer/image_shimmer.dart';

class RoundedImageLayout extends StatelessWidget {
  const RoundedImageLayout(
      {super.key,
      this.width,
      this.height,
      required this.imageUrl,
      this.applyImageRadius = true,
      this.border,
      this.backGroundColor,
      this.padding,
      this.borderRadius = 16,
      this.fit = BoxFit.contain,
      this.onPressed,
      this.isNetworkImage = false});

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backGroundColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final BoxFit? fit;
  final VoidCallback? onPressed;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            border: border,
            color: backGroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    imageUrl: imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const ImageShimmerEffect(height: 55, width: 55),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(fit: fit, image: AssetImage(imageUrl) as ImageProvider),
          ),
        ));
  }
}
