import 'package:flutter/material.dart';

class IconContainerBox extends StatelessWidget {
  const IconContainerBox(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.backGroungColor = Colors.white,
      this.radius = 14,
      this.shape = BoxShape.rectangle,
      required this.icon,
      this.onTap,
      this.isCircle = false,
      this.boxShadow});

  final double width, height;
  final double radius;
  final Color backGroungColor;
  final BoxShape shape;
  final Icon icon;
  final VoidCallback? onTap;
  final bool isCircle;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backGroungColor,
          borderRadius: isCircle ? null : BorderRadius.circular(radius),
          shape: shape,
          boxShadow: boxShadow),
      child: GestureDetector(onTap: onTap, child: icon),
    );
  }
}
