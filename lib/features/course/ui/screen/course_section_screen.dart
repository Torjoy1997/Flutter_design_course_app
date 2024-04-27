import 'package:flutter/material.dart';

import 'package:programming_course/core/components/card/model/course_card_model.dart';
import 'package:programming_course/utils/constants/colors.dart';
import 'package:programming_course/utils/constants/text_design.dart';

import '../widget/course_section_card.dart';

class CourseSectionScreen extends StatelessWidget {
  const CourseSectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(children: [
      DecoratedBox(
        decoration: const BoxDecoration(
            color: AppDefineColors.kBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34.0),
                topRight: Radius.circular(34.0),
                bottomLeft: Radius.circular(34.0),
                bottomRight: Radius.circular(34.0)),
            boxShadow: [
              BoxShadow(
                  color: AppDefineColors.kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 32)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Course Sections",
              style: AppCourseTextStyle.kTitle2Style,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              "12 sections",
              style: AppCourseTextStyle.kSubtitleStyle,
            ),
          ],
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              itemBuilder: (_, index) => CourseSectionCard(
                    courseData: courseSections[index],
                  ),
              separatorBuilder: (_, __) => const SizedBox(
                    height: 16,
                  ),
              itemCount: courseSections.length),
        ),
      )
    ]));
  }
}
