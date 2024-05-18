import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:programming_course/utils/constants/input_decoration.dart';

import '../../../../../core/layouts/outline_input_field.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_design.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../repos/sing_up.dart';

class UserInputField extends StatelessWidget {
  const UserInputField({super.key, required this.editController});

  final SignUpRepository editController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      OutLineInputFieldLayout(
          child: TextFormField(
        controller: editController.nameOfUser,
        validator: (value) => FormValidator.validateEmptyText('Name', value),
        style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w500,
            height: 1.2),
        cursorColor: AppDefineColors.kPrimaryLabelColor,
        decoration: AppInputDesign.kOutlineDesign.copyWith(
          prefixIcon: const Icon(
            Iconsax.user,
            color: Colors.blueAccent,
          ),
          hintText: 'User',
        ),
      )),
      const SizedBox(
        height: 20,
      ),
      OutLineInputFieldLayout(
          child: TextFormField(
        controller: editController.email,
        validator: (value) => FormValidator.validateEmail(value),
        style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w500,
            height: 1.2),
        cursorColor: AppDefineColors.kPrimaryLabelColor,
        decoration: AppInputDesign.kOutlineDesign.copyWith(
            prefixIcon: const Icon(
              Iconsax.sms_edit,
              color: Colors.blueAccent,
            ),
            hintText: 'Email'),
        keyboardType: TextInputType.emailAddress,
      )),
      const SizedBox(
        height: 20,
      ),
      OutLineInputFieldLayout(
          child: TextFormField(
        controller: editController.phoneNumber,
        validator: (value) => FormValidator.validatePhoneNumber(value),
        style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w500,
            height: 1.2),
        cursorColor: AppDefineColors.kPrimaryLabelColor,
        decoration: AppInputDesign.kOutlineDesign.copyWith(
          hintText: 'Phone Number',
          prefixIcon: const Icon(
            Iconsax.call,
            color: Colors.blueAccent,
          ),
        ),
        keyboardType: TextInputType.phone,
      )),
    ]);
  }
}
