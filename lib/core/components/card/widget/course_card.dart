import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text_design.dart';
import '../model/course_card_model.dart';

class CourseCardView extends StatelessWidget {
  const CourseCardView({super.key, required this.courseData});

  final CourseModel courseData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('CourseDetail',
            pathParameters: {'id': courseData.courseTitle}, extra: courseData);
      },
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                  gradient: courseData.background,
                  borderRadius: BorderRadius.circular(41.0),
                  boxShadow: [
                    BoxShadow(
                        color:
                            courseData.background.colors.first.withOpacity(0.3),
                        offset: const Offset(0, 20),
                        blurRadius: 30.0),
                    BoxShadow(
                        color:
                            courseData.background.colors.last.withOpacity(0.3),
                        offset: const Offset(0, 20),
                        blurRadius: 30.0)
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32.0, left: 32.0, right: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: courseData.courseSubtitle,
                          child: Text(
                            courseData.courseSubtitle,
                            style: AppCourseTextStyle.kCardSubtitleStyle,
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Hero(
                          tag: courseData.courseTitle,
                          child: Text(
                            courseData.courseTitle,
                            style: AppCourseTextStyle.kCardTitleStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: Hero(
                    tag: courseData.illustration,
                    child: Image.asset(
                      'asset/illustrations/${courseData.illustration}',
                      fit: BoxFit.cover,
                    ),
                  ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 42.0),
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: const [
                    BoxShadow(
                        color: AppDefineColors.kShadowColor,
                        offset: Offset(0, 4),
                        blurRadius: 16)
                  ]),
              child: Hero(
                  tag: courseData.logo ?? 'logo',
                  child: Image.asset('asset/logos/${courseData.logo}')),
            ),
          )
        ],
      ),
    );
  }
}
