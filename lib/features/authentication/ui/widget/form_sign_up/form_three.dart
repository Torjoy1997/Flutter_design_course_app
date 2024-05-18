import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:programming_course/utils/validators/validation.dart';

import '../../../../../core/layouts/outline_input_field.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/input_decoration.dart';
import '../../../../../utils/constants/text_design.dart';
import '../../../repos/sing_up.dart';

class SecurityInputField extends StatefulWidget {
  const SecurityInputField({super.key, required this.editController});

  final SignUpRepository editController;

  @override
  State<SecurityInputField> createState() => _SecurityInputFieldState();
}

class _SecurityInputFieldState extends State<SecurityInputField> {
  void updateDateBirth(String selectedDate) {
    setState(() {
      widget.editController.dateOfBirth.text = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutLineInputFieldLayout(
          child: TextFormField(
            controller: widget.editController.dateOfBirth,
            readOnly: true,
            decoration: AppInputDesign.kOutlineDesign.copyWith(
              prefixIcon: const Icon(
                Iconsax.calendar,
                color: Colors.blueAccent,
              ),
              hintText: 'Date of Birth',
            ),
            onTap: () async {
              await widget.editController.selectDate(context, updateDateBirth);
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        OutLineInputFieldLayout(
          child: TextFormField(
            validator: (value) => FormValidator.validatePassword(value),
            controller: widget.editController.password,
            style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w500,
                height: 1.2),
            cursorColor: AppDefineColors.kPrimaryLabelColor,
            decoration: AppInputDesign.kOutlineDesign.copyWith(
              hintText: 'password',
              prefixIcon: const Icon(
                Iconsax.lock,
                color: Colors.blueAccent,
              ),
            ),
            obscureText: true,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        OutLineInputFieldLayout(
            child: TextFormField(
          controller: widget.editController.confirmPassword,
          validator: (value) => FormValidator.validateConfirmPassword(
              value, widget.editController.password.text),
          obscureText: true,
          style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w500,
              height: 1.2),
          cursorColor: AppDefineColors.kPrimaryLabelColor,
          decoration: AppInputDesign.kOutlineDesign.copyWith(
            hintText: 'Confirm Password',
            prefixIcon: const Icon(
              Iconsax.lock,
              color: Colors.blueAccent,
            ),
          ),
        ))
      ],
    );
  }
}
