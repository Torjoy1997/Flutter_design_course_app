import 'package:flutter/material.dart';
import 'package:programming_course/core/components/bottom_sheet_design.dart';

import '../../../../core/components/heading_title.dart';
import 'certificate_view.dart';
import 'popular_course_list.dart';

class BottomSlideUpPanle extends StatelessWidget {
  const BottomSlideUpPanle({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomDraggAbleSheet(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
            child: Container(
              width: 42.0,
              height: 4.0,
              decoration: BoxDecoration(
                  color: const Color(0xFFC5CBD6),
                  borderRadius: BorderRadius.circular(2.0)),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              HeadingTitle(title: 'Popular Course'),
              SizedBox(
                height: 10,
              ),
              PopularCourseList(),
              HeadingTitle(title: 'Certificate'),
              CertificateViewer()
            ],
          )
        ],
      ),
    );
  }
}
