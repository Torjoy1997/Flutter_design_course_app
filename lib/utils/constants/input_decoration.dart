import 'package:flutter/material.dart';
import 'package:programming_course/utils/constants/text_design.dart';

class AppInputDesign {
  static var kOutlineDesign = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(15)),
    hintStyle: AppCourseTextStyle.kLoginInputTextStyle,
  );
}
