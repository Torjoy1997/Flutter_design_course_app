import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:programming_course/core/layouts/icon_layout.dart';
import 'package:programming_course/features/profile/ui/widget/profile_appbar_bottom.dart';
import 'package:programming_course/utils/constants/colors.dart';

import '../../../../utils/constants/text_design.dart';

class ProfileAppBarBody extends StatelessWidget {
  const ProfileAppBarBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppDefineColors.kBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(34.0),
          bottomRight: Radius.circular(34.0),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                bottom: 32.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: const IconContainerBox(
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppDefineColors.kSecondaryLabelColor,
                      ),
                      backGroungColor: AppDefineColors.kBackgroundColor,
                    ),
                  ),
                  Text(
                    'Profile',
                    style: AppCourseTextStyle.kCallOutLabelStyle,
                  ),
                  IconContainerBox(
                    icon: Icon(
                      Platform.isAndroid
                          ? Icons.settings
                          : CupertinoIcons.settings_solid,
                      color: AppDefineColors.kSecondaryLabelColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Container(
                    height: 84.0,
                    width: 84.0,
                    decoration: BoxDecoration(
                      gradient: const RadialGradient(
                        colors: [
                          Color(0xFF00AEFF),
                          Color(0xFF0076FF),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(42.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: AppDefineColors.kBackgroundColor,
                          borderRadius: BorderRadius.circular(42.0),
                        ),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('asset/images/profile.png'),
                          radius: 30.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MD TAREKUL ISLAM",
                        style: AppCourseTextStyle.kTitle2Style,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Flutter Developer",
                        style: AppCourseTextStyle.kSecondaryCallOutLabelStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ProfileAppBottom()
          ],
        ),
      ),
    );
  }
}
