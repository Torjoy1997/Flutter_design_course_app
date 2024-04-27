import 'package:flutter/material.dart';
import 'package:programming_course/core/components/card/model/course_card_model.dart';

import 'package:programming_course/core/components/card/widget/explore_course_with_icon.dart';

class PopularCourseList extends StatelessWidget {
  const PopularCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) =>
            ExploreCardWithIcon(courseData: continueWatchingCourses[index]),
        itemCount: exploreCourses.length,
        separatorBuilder: (_, __) => const SizedBox(
          width: 32,
        ),
      ),
    );
  }
}
