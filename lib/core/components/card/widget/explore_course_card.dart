import 'package:flutter/material.dart';
import 'package:programming_course/core/components/card/model/course_card_model.dart';
import 'package:programming_course/utils/constants/text_design.dart';

class ExploreCourseCard extends StatelessWidget {
  const ExploreCourseCard({super.key, required this.courseData});

  final CourseModel courseData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 280,
      padding: const EdgeInsets.only(left: 32),
      decoration: BoxDecoration(
          gradient: courseData.background,
          borderRadius: BorderRadius.circular(41)),
      child: Row(
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
                const SizedBox(height: 6.0),
                Text(
                  courseData.courseTitle,
                  style: AppCourseTextStyle.kCardTitleStyle,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'asset/illustrations/${courseData.illustration}',
                fit: BoxFit.cover,
                height: 100,
              )
            ],
          )
        ],
      ),
    );
  }
}
