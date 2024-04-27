import 'package:flutter/material.dart';
import 'package:programming_course/core/components/card/model/course_card_model.dart';
import 'package:programming_course/core/components/card/widget/explore_course_card.dart';

class ExploreCourseList extends StatelessWidget {
  const ExploreCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (_, index) =>
            ExploreCourseCard(courseData: exploreCourses[index]),
        itemCount: exploreCourses.length,
        separatorBuilder: (_, __) => const SizedBox(
          width: 32,
        ),
      ),
    );
  }
}
