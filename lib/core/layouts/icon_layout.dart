import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class IconContainerBox extends StatelessWidget {
  const IconContainerBox(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.backGroungColor = Colors.white,
      required this.icon});

  final double width, height;
  final Color backGroungColor;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: const [
          BoxShadow(
            color: AppDefineColors.kShadowColor,
            offset: Offset(0, 12),
            blurRadius: 32.0,
          )
        ],
      ),
      child: icon,
    );
  }
}
