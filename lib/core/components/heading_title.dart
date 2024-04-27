import 'package:flutter/material.dart';

import '../../utils/constants/text_design.dart';

class HeadingTitle extends StatelessWidget {
  const HeadingTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: AppCourseTextStyle.kTitle1Style,
          )
        ],
      ),
    );
  }
}
