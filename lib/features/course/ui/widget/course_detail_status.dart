import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_design.dart';

class CourseStatus extends StatelessWidget {
  const CourseStatus(
      {super.key,
      required this.iconData,
      required this.numbers,
      required this.member});

  final IconData iconData;
  final String numbers, member;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(29.0),
            ),
            child: CircleAvatar(
              radius: 21.0,
              backgroundColor: AppDefineColors.kCourseElementIconColor,
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              numbers,
              style: AppCourseTextStyle.kTitle2Style,
            ),
            Text(
              member,
              style: AppCourseTextStyle.kSearchPlaceholderStyle,
            ),
          ],
        )
      ],
    );
  }
}
