import 'package:flutter/material.dart';

import 'package:programming_course/core/components/card/model/course_card_model.dart';
import 'package:programming_course/core/components/card/widget/course_card.dart';
import 'package:programming_course/utils/helper/app_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RecentCourseList extends StatefulWidget {
  const RecentCourseList({super.key});

  @override
  State<RecentCourseList> createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  PageController pageController = PageController(
      initialPage: 0,
      viewportFraction: AppHelperFunctions.screenWidth > 360 ? 0.7 : 0.8);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (_, index) => Opacity(
              opacity: index == currentIndex ? 1.0 : 0.5,
              child: CourseCardView(
                courseData: recentCourses[index],
              ),
            ),
            itemCount: recentCourses.length,
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: recentCourses.length,
          effect: const ExpandingDotsEffect(
              activeDotColor: Color(0xFF0971FE), dotHeight: 6, dotWidth: 10),
        )
      ],
    );
  }
}
