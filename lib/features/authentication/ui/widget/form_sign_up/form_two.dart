import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:programming_course/utils/constants/input_decoration.dart';

import '../../../../../core/layouts/outline_input_field.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../repos/sing_up.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_design.dart';

class UserAddressInputField extends StatelessWidget {
  const UserAddressInputField({super.key, required this.editController});
  final SignUpRepository editController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutLineInputFieldLayout(
            child: TextFormField(
          controller: editController.street,
          validator: (value) =>
              FormValidator.validateEmptyText('Street', value),
          style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
              height: 1.2),
          cursorColor: AppDefineColors.kPrimaryLabelColor,
          decoration: AppInputDesign.kOutlineDesign.copyWith(
              prefixIcon: const Icon(
                Iconsax.building_31,
                color: Colors.blueAccent,
              ),
              hintText: 'Street No'),
        )),
        const SizedBox(
          height: 10,
        ),
        OutLineInputFieldLayout(
            child: TextFormField(
          validator: (value) =>
              FormValidator.validateEmptyText('PostCode', value),
          controller: editController.postCode,
          style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
              height: 1.2),
          cursorColor: AppDefineColors.kPrimaryLabelColor,
          decoration: AppInputDesign.kOutlineDesign.copyWith(
              prefixIcon: const Icon(
                Iconsax.code,
                color: Colors.blueAccent,
              ),
              hintText: 'Post Code'),
        )),
        const SizedBox(
          height: 10,
        ),
        OutLineInputFieldLayout(
            child: TextFormField(
          controller: editController.city,
          validator: (value) => FormValidator.validateEmptyText('City', value),
          style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
              height: 1.2),
          cursorColor: AppDefineColors.kPrimaryLabelColor,
          decoration: AppInputDesign.kOutlineDesign.copyWith(
            hintText: 'City',
            prefixIcon: const Icon(
              Iconsax.building,
              color: Colors.blueAccent,
            ),
          ),
        )),
        const SizedBox(
          height: 10,
        ),
        OutLineInputFieldLayout(
            child: TextFormField(
          validator: (value) =>
              FormValidator.validateEmptyText('Country', value),
          controller: editController.country,
          style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
              height: 1.2),
          cursorColor: AppDefineColors.kPrimaryLabelColor,
          decoration: AppInputDesign.kOutlineDesign.copyWith(
            prefixIcon: const Icon(
              Iconsax.global,
              color: Colors.blueAccent,
            ),
            hintText: 'country',
          ),
        )),
      ],
    );
  }
}
