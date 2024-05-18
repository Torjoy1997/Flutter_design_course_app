import 'dart:math';

import 'package:flutter/material.dart';

class AppDefineColors {
  static const kBackgroundColor = Color(0xFFE7EEFB);
  static const kSidebarBackgroundColor = Color(0xFFF1F4FB);
  static const kCardPopupBackgroundColor = Color(0xFFF5F8FF);
  static const kPrimaryLabelColor = Color(0xFF242629);
  static const kSecondaryLabelColor = Color(0xFF797F8A);
  static const kShadowColor = Color.fromRGBO(72, 76, 82, 0.16);
  static const kCourseElementIconColor = Color(0xFF17294D);

  static const kDrakGradiant = LinearGradient(
    colors: [Color(0xffd6deff), Color(0xffb574ab), Color(0xff6e4291)],
    stops: [0, 0.67, 1],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
  );

  static var kLinerBackground = LinearGradient(colors: [
    const Color(0xFFFFFFFF).withOpacity(0.60),
    const Color(0xffffffff).withOpacity(0.50)
  ], stops: const [
    0,
    1
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static var kLinerBorder = LinearGradient(colors: [
    const Color(0xFFFFFFFF).withOpacity(0.1),
    const Color(0xffffffff)
  ], stops: const [
    0,
    1
  ], begin: Alignment.centerRight, end: Alignment.centerLeft);
  static var kLinerCardBackGround = SweepGradient(
      colors: [
        const Color(0xfff262b5).withOpacity(0),
        const Color(0xff5fc5ff),
        const Color(0xffffac89),
        const Color(0xff8155ff),
        const Color(0xff789dff),
        const Color(0xff9f73f1).withOpacity(0)
      ],
      stops: const [
        0.35,
        0.54,
        0.60,
        0.66,
        0.72,
        0.86
      ],
      center: Alignment.center,
      transform: const GradientRotation(pi / 2),
      tileMode: TileMode.decal);

  static var kLinerCardBackGround2 = SweepGradient(
      colors: [
        const Color(0xff42e8f8).withOpacity(0),
        const Color(0xffFF7EAB).withOpacity(0.5),
        const Color(0xff3083FF),
        const Color(0xff7147FF),
      ],
      stops: const [
        0.26,
        0.52,
        0.76,
        1,
      ],
      center: Alignment.center,
      transform: const GradientRotation(90),
      tileMode: TileMode.decal);
}
