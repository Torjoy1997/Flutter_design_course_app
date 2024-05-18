import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:programming_course/core/components/sidebar_items/ui/side_items_view.dart';
import 'package:programming_course/features/authentication/bloc/auth_bloc.dart';
import 'package:programming_course/utils/constants/text_design.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../core/components/sidebar_items/dummy_data.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppDefineColors.kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.0),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(
        vertical: 35.0,
        horizontal: 20.0,
      ),
      child: SafeArea(
        child: Column(children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('asset/images/profile.png'),
                radius: 21.0,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MD TAREKUL ISLAM",
                    style: AppCourseTextStyle.kHeadlineLabelStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "License ends on 21 Jan, 2021",
                    style: AppCourseTextStyle.kSearchPlaceholderStyle,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, index) => SidebarRow(
                      item: sidebarItem[index],
                    ),
                separatorBuilder: (_, __) => const SizedBox(
                      height: 15,
                    ),
                itemCount: sidebarItem.length),
          ),
          GestureDetector(
            onTap: () {
              context.read<AuthBloc>().add(LogOutEvent());
            },
            child: const Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'LogOut',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF242629),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
