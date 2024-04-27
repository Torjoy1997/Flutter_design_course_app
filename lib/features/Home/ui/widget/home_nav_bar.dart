import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../core/components/search_field.dart';
import '../../../../core/components/sidebar_items/side_button.dart';

class HomeScreenNavBar extends StatelessWidget {
  const HomeScreenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SideBarButton(),
        const SearchFieldWidget(),
        const Icon(
          Icons.notifications,
          color: AppDefineColors.kPrimaryLabelColor,
        ),
        const SizedBox(
          width: 16.0,
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed('Profile');
          },
          child: const CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage('asset/images/profile.png'),
          ),
        )
      ],
    );
  }
}
