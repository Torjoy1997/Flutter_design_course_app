import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class GlassRainBow extends StatelessWidget {
  const GlassRainBow({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: AppDefineColors.kLinerCardBackGround,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
                blurRadius: 4)
          ]),
      child: ClipRRect(
        child: BackdropFilter(
          blendMode: BlendMode.srcOver,
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              gradient: AppDefineColors.kLinerBackground,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
