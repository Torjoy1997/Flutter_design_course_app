import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:programming_course/core/layouts/icon_layout.dart';
import 'package:programming_course/features/authentication/bloc/auth_bloc.dart';

import 'package:programming_course/features/authentication/repos/sing_up.dart';
import 'package:programming_course/utils/constants/enums.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/text_design.dart';
import 'form_one.dart';
import 'form_three.dart';
import 'form_two.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({
    super.key,
    required this.editController,
  });

  final SignUpRepository editController;

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  int currentIndex = 0;
  SignUpRepository get editController => widget.editController;

  List<double> positionOffsetForward = [0.0, 250.0, 500.0];
  List<double> positionOffsetBackWord = [126.0, 393.0, 0.0];

  get inputScreen => [
        UserInputField(
          editController: editController,
        ),
        UserAddressInputField(
          editController: editController,
        ),
        SecurityInputField(
          editController: editController,
        )
      ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            'Register',
            textAlign: TextAlign.center,
            style: AppCourseTextStyle.kLargeTitleStyle
                .copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
            key: editController.addressFormKey,
            child: Flexible(
              flex: currentIndex == 1 ? 8 : 4,
              child: SizedBox(
                height: currentIndex == 1 ? 453 : 300,
                child: PageView.builder(
                  itemBuilder: (_, index) => inputScreen[index],
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: inputScreen.length,
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                ),
              ),
            ),
          ),

          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconContainerBox(
                  width: 24,
                  height: 24,
                  shape: BoxShape.circle,
                  icon: const Icon(
                    Iconsax.arrow_left_3,
                    color: Colors.white,
                  ),
                  backGroungColor: currentIndex == 0
                      ? Colors.grey.shade300
                      : Colors.black.withOpacity(0.6),
                  isCircle: true,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                    ),
                  ],
                  onTap: () {
                    if (currentIndex > 0) {
                      context.read<AuthBloc>().add(const ValidateStatusEvent(
                          validateStatus: ValidateStatus.none));
                      // pageController.previousPage(
                      //     duration: const Duration(microseconds: 1500),
                      //     curve: Curves.easeInOut);
                      pageController.animateTo(
                          positionOffsetBackWord[currentIndex - 1],
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: inputScreen.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: Color(0xFF0971FE),
                      dotHeight: 6,
                      dotWidth: 10),
                ),
                IconContainerBox(
                  width: 24,
                  height: 24,
                  shape: BoxShape.circle,
                  icon: const Icon(
                    Iconsax.arrow_right_2,
                    color: Colors.white,
                  ),
                  backGroungColor: currentIndex == 2
                      ? Colors.grey.shade300
                      : Colors.black.withOpacity(0.6),
                  isCircle: true,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 10),
                      blurRadius: 10,
                    ),
                  ],
                  onTap: () {
                    if (currentIndex < 2) {
                      if (editController.addressFormKey.currentState!
                          .validate()) {
                        context.read<AuthBloc>().add(const ValidateStatusEvent(
                            validateStatus: ValidateStatus.validate));
                        // pageController.nextPage(
                        //     duration: const Duration(microseconds: 1500),
                        //     curve: Curves.easeIn);
                        pageController.animateTo(
                            positionOffsetForward[currentIndex + 1],
                            duration: const Duration(microseconds: 500),
                            curve: Curves.easeInOut);
                      } else {
                        context.read<AuthBloc>().add(const ValidateStatusEvent(
                            validateStatus: ValidateStatus.invalid));
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          //button
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: currentIndex == (inputScreen.length - 1)
                  ? () {
                      if (editController.addressFormKey.currentState!
                          .validate()) {
                        context.read<AuthBloc>().add(SignUpEvent());
                      } else {
                        context.read<AuthBloc>().add(const ValidateStatusEvent(
                            validateStatus: ValidateStatus.invalid));
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                  elevation: 3, backgroundColor: const Color(0xFF73A0F4)),
              child: Text(
                'Submit',
                style: AppCourseTextStyle.kCallOutLabelStyle
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
              text: 'Already have an account?  ',
              style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
                color: const Color(0xFF1B1E9C).withOpacity(0.5),
              ),
            ),
            TextSpan(
                text: 'Login',
                style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
                    color: const Color(0xFF1B1E9C).withOpacity(0.5),
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.goNamed('Login');
                  })
          ])),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
