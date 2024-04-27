import 'package:flutter/material.dart';

import '../../../../core/components/card/model/course_card_model.dart';
import '../../../../utils/constants/text_design.dart';

class CourseSectionCard extends StatelessWidget {
  const CourseSectionCard({super.key, required this.courseData});

  final CourseModel courseData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          gradient: courseData.background,
          borderRadius: BorderRadius.circular(41),
          boxShadow: [
            BoxShadow(
              color: courseData.background.colors[0].withOpacity(0.3),
              blurRadius: 30.0,
              offset: const Offset(0, 20),
            ),
            BoxShadow(
              color: courseData.background.colors[1].withOpacity(0.3),
              blurRadius: 30.0,
              offset: const Offset(0, 20),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'asset/illustrations/${courseData.illustration}',
                    fit: BoxFit.cover,
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseData.courseSubtitle,
                          style: AppCourseTextStyle.kCardSubtitleStyle,
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          courseData.courseTitle,
                          style: AppCourseTextStyle.kCardTitleStyle,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
