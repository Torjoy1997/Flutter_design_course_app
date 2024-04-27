import 'dart:io';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppCourseTextStyle {
  static var kLargeTitleStyle = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppDefineColors.kPrimaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
  );
  static var kTitle1Style = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: AppDefineColors.kPrimaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
  );
  static var kCardTitleStyle = TextStyle(
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 22.0,
    decoration: TextDecoration.none,
  );
  static var kTitle2Style = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppDefineColors.kPrimaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
  );
  static var kHeadlineLabelStyle = const TextStyle(
    fontSize: 17.0,
    fontWeight: FontWeight.w800,
    color: AppDefineColors.kPrimaryLabelColor,
    fontFamily: 'SF Pro Text',
    decoration: TextDecoration.none,
  );
  static var kSubtitleStyle = TextStyle(
    fontSize: 16.0,
    color: AppDefineColors.kSecondaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
  );
  static var kBodyLabelStyle = TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w100);
  static var kCallOutLabelStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w800,
    color: AppDefineColors.kPrimaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
  );
  static var kSecondaryCallOutLabelStyle = TextStyle(
    fontSize: 16.0,
    color: AppDefineColors.kSecondaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
  );
  static var kSearchPlaceholderStyle = TextStyle(
    fontSize: 13.0,
    color: AppDefineColors.kSecondaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
  );
  static var kSearchTextStyle = TextStyle(
    fontSize: 13.0,
    color: AppDefineColors.kPrimaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
  );
  static var kCardSubtitleStyle = TextStyle(
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    color: const Color(0xE6FFFFFF),
    fontSize: 13.0,
    decoration: TextDecoration.none,
  );
  static var kCaptionLabelStyle = TextStyle(
    fontSize: 12.0,
    color: AppDefineColors.kSecondaryLabelColor,
    fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
    decoration: TextDecoration.none,
  );
}
