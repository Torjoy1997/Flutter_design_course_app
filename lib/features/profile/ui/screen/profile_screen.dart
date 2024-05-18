import 'package:flutter/material.dart';

import 'package:programming_course/core/components/card/model/course_card_model.dart';
import 'package:programming_course/core/components/card/widget/explore_course_with_icon.dart';
import 'package:programming_course/core/components/heading_title.dart';
import 'package:programming_course/features/home/ui/widget/certificate_view.dart';
import 'package:programming_course/utils/constants/colors.dart';
import 'package:programming_course/utils/constants/text_design.dart';

import '../widget/profile_appbar_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const ProfileAppBarBody(),
        toolbarHeight: 370,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeadingTitle(title: 'Certificates'),
            const CertificateViewer(),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Completed Courses",
                    style: AppCourseTextStyle.kHeadlineLabelStyle,
                  ),
                  Row(
                    children: [
                      Text(
                        "See all",
                        style: AppCourseTextStyle.kSearchPlaceholderStyle,
                      ),
                      const Icon(Icons.chevron_right,
                          color: AppDefineColors.kSecondaryLabelColor),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.separated(
                itemBuilder: (_, index) =>
                    ExploreCardWithIcon(courseData: completedCourses[index]),
                separatorBuilder: (_, __) => const SizedBox(
                  width: 15,
                ),
                itemCount: completedCourses.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
