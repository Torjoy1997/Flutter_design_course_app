import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/text_design.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 33.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.0),
            boxShadow: const [
              BoxShadow(
                color: AppDefineColors.kShadowColor,
                offset: Offset(0, 12),
                blurRadius: 16.0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              cursorColor: AppDefineColors.kPrimaryLabelColor,
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.search,
                  color: AppDefineColors.kPrimaryLabelColor,
                  size: 20.0,
                ),
                border: InputBorder.none,
                hintText: "Search for courses",
                hintStyle: AppCourseTextStyle.kSearchPlaceholderStyle,
              ),
              style: AppCourseTextStyle.kSearchTextStyle,
              onChanged: (newText) {},
            ),
          ),
        ),
      ),
    );
  }
}
