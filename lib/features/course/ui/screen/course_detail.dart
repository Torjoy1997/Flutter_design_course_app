import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:programming_course/config/global_contex.dart';
import 'package:programming_course/core/components/card/model/course_card_model.dart';
import 'package:programming_course/core/components/paly_button_icon.dart';
import 'package:programming_course/features/course/ui/screen/course_section_screen.dart';
import 'package:programming_course/features/course/ui/widget/course_detail_status.dart';
import 'package:programming_course/utils/constants/colors.dart';
import 'package:programming_course/utils/constants/text_design.dart';
import 'package:programming_course/utils/constants/text_string.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key, required this.courseData});

  final CourseModel courseData;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  double screenWidth =
      MediaQuery.of(NavigationService.currentContex).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: screenWidth < 400
          ? FloatingActionButton(
              child: const Icon(
                Icons.arrow_drop_up,
                color: Colors.black,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const CourseSectionScreen();
                  },
                );
              },
            )
          : null,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        gradient: widget.courseData.background,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: SafeArea(
                      bottom: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Hero(
                                    tag: widget.courseData.logo ?? 'logo',
                                    child: Image.asset(
                                      'asset/logos/${widget.courseData.logo}',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag: widget.courseData.courseSubtitle,
                                        child: Text(
                                          widget.courseData.courseSubtitle,
                                          style: AppCourseTextStyle
                                              .kSecondaryCallOutLabelStyle
                                              .copyWith(color: Colors.white70),
                                        ),
                                      ),
                                      Hero(
                                        tag: widget.courseData.courseTitle,
                                        child: Text(
                                          widget.courseData.courseTitle,
                                          style: AppCourseTextStyle
                                              .kLargeTitleStyle
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.pop();
                                  },
                                  child: Container(
                                    width: 36.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: AppDefineColors.kPrimaryLabelColor
                                          .withOpacity(0.8),
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 28,
                          ),
                          Expanded(
                              child: Hero(
                            tag: widget.courseData.illustration,
                            child: Image.asset(
                              'asset/illustrations/${widget.courseData.illustration}',
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  const PlayButton(),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    left: 28.0,
                    right: 28.0,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CourseStatus(
                            iconData: Platform.isAndroid
                                ? Icons.people
                                : CupertinoIcons.group_solid,
                            numbers: '25.7k',
                            member: 'Student'),
                        CourseStatus(
                            iconData: Platform.isAndroid
                                ? Icons.format_quote
                                : CupertinoIcons.news_solid,
                            numbers: '12.7k',
                            member: 'Comments'),
                        const SizedBox(
                          width: 10,
                        ),
                        if (screenWidth > 400)
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CourseSectionScreen();
                                },
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppDefineColors.kShadowColor,
                                    offset: Offset(0, 12),
                                    blurRadius: 16.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              width: 80.0,
                              height: 40.0,
                              child: Text(
                                'View All',
                                style: AppCourseTextStyle.kSearchTextStyle,
                              ),
                            ),
                          ),
                      ])),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppDefineTextValue.courseDetail,
                      style: AppCourseTextStyle.kBodyLabelStyle,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "About this course",
                      style: AppCourseTextStyle.kTitle1Style,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      AppDefineTextValue.courseDetail2,
                      style: AppCourseTextStyle.kBodyLabelStyle,
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
