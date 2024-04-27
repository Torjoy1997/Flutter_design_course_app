import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:programming_course/utils/constants/colors.dart';

import '../../../../utils/constants/text_design.dart';

class ProfileAppBottom extends StatelessWidget {
  ProfileAppBottom({super.key});

  final List<String> badges = [
    'badge-01.png',
    'badge-02.png',
    'badge-03.png',
    'badge-04.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 28.0,
            bottom: 16.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Badges",
                style: AppCourseTextStyle.kHeadlineLabelStyle,
              ),
              Row(
                children: [
                  Text(
                    "See all",
                    style: AppCourseTextStyle.kSearchPlaceholderStyle,
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: AppDefineColors.kSecondaryLabelColor,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        SizedBox(
          height: 90.0,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: badges.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppDefineColors.kShadowColor.withOpacity(0.1),
                      offset: const Offset(0, 12),
                      blurRadius: 18.0,
                    ),
                  ],
                ),
                child: Image.asset('asset/badges/${badges[index]}'),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(
              width: 15,
            ),
          ),
        )
      ],
    );
  }
}
