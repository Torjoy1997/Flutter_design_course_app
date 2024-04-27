import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_design.dart';
import '../model/course_card_model.dart';

class ExploreCardWithIcon extends StatelessWidget {
  const ExploreCardWithIcon({super.key, required this.courseData});

  final CourseModel courseData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, bottom: 15, top: 20, right: 20),
          child: Container(
            height: 180,
            width: 280,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                gradient: courseData.background,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color:
                          courseData.background.colors.first.withOpacity(0.3),
                      offset: const Offset(5, 10),
                      blurRadius: 15.0),
                  BoxShadow(
                      color: AppDefineColors.kShadowColor.withOpacity(0.3),
                      offset: const Offset(5, 10),
                      blurRadius: 15.0),
                ]),
            child: ClipRRect(
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'asset/illustrations/${courseData.illustration}',
                          fit: BoxFit.cover,
                          height: 100,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: -5,
          right: 0,
          child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                        color: AppDefineColors.kShadowColor,
                        offset: Offset(0, 4),
                        blurRadius: 16)
                  ]),
              child: Image.asset('asset/icons/icon-play.png')),
        ),
      ],
    );
  }
}
