import 'package:flutter/material.dart';

import 'package:programming_course/core/components/heading_title.dart';
import 'package:programming_course/features/Home/ui/widget/slide_up_panale.dart';

import 'package:programming_course/utils/constants/colors.dart';
import 'package:programming_course/utils/constants/text_design.dart';

import '../widget/explore_course_list.dart';
import '../widget/home_nav_bar.dart';
import '../widget/recent_course_list.dart';
import '../widget/sidebar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarScreen(),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: AppDefineColors.kBackgroundColor,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const HomeScreenNavBar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Recents',
                            style: AppCourseTextStyle.kTitle1Style,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '23 courses are coming',
                            style: AppCourseTextStyle.kSubtitleStyle,
                          ),
                        ],
                      ),
                    ),
                    const RecentCourseList(),
                    const HeadingTitle(title: 'Explore'),
                    const ExploreCourseList(),
                  ],
                ),
              ),
            ),
          ),
          const BottomSlideUpPanle()
        ],
      ),
    );
  }
}
