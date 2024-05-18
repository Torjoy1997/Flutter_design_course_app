import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:programming_course/core/components/snack_bar.dart';
import 'package:programming_course/features/authentication/bloc/auth_bloc.dart';
import 'package:programming_course/utils/constants/colors.dart';
import 'package:programming_course/utils/constants/text_design.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          showErrorSnackBar(context, msg: state.errorMessage);
        }
        if (state is LoginSuccessState) {
          context.goNamed('Home');
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            color: AppDefineColors.kSidebarBackgroundColor,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      child: Image.asset(
                          'asset/illustrations/illustration-14.png'),
                    ),
                    Positioned(
                      top: 103,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Text(
                              'Learn to Design \nand App Code',
                              style:
                                  AppCourseTextStyle.kLargeTitleStyle.copyWith(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              "Completed courses about the best\ntools and design systems",
                              style: AppCourseTextStyle.kHeadlineLabelStyle
                                  .copyWith(color: Colors.white70),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 80,
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Log in to\n',
                              style: AppCourseTextStyle.kLargeTitleStyle),
                          TextSpan(
                              text: 'Start Learning',
                              style: AppCourseTextStyle.kLargeTitleStyle
                                  .copyWith(color: const Color(0xFF5B4CF0)))
                        ]),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 280,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: const Color(0xFFFAFCFF),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xFF5E636B),
                                  offset: Offset(0, 12),
                                  blurRadius: 16)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            right: 16,
                            left: 16,
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: email,
                                cursorColor: AppDefineColors.kPrimaryLabelColor,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: 'Email address',
                                  helperStyle:
                                      AppCourseTextStyle.kLoginInputTextStyle,
                                  prefixIcon: const Icon(
                                    Icons.mail,
                                    color: Color(0xFF5488F1),
                                  ),
                                  labelStyle: AppCourseTextStyle
                                      .kLoginInputTextStyle
                                      .copyWith(color: Colors.black),
                                  border: InputBorder.none,
                                ),
                              ),
                              const Divider(),
                              TextFormField(
                                controller: password,
                                cursorColor: AppDefineColors.kPrimaryLabelColor,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  helperStyle:
                                      AppCourseTextStyle.kLoginInputTextStyle,
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Color(0xFF5488F1),
                                  ),
                                  labelStyle: AppCourseTextStyle
                                      .kLoginInputTextStyle
                                      .copyWith(color: Colors.black),
                                  border: InputBorder.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Container(
                              width: 122,
                              height: 48,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF73A0F4),
                                        Color(0xFF4A47F5),
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xFF5E636B),
                                        offset: Offset(0, 5),
                                        blurRadius: 4)
                                  ]),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<AuthBloc>().add(LoginEvent(
                                      email: email.text.trim(),
                                      password: password.text.trim()));
                                },
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: AppCourseTextStyle.kCallOutLabelStyle
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 122,
                              height: 48,
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(14)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xFF000000)
                                            .withOpacity(0.5),
                                        offset: const Offset(0, 4),
                                        blurRadius: 10),
                                  ]),
                              child: GestureDetector(
                                onTap: () {
                                  context.pushNamed('SignUp');
                                },
                                child: Center(
                                  child: Text(
                                    'SignUp',
                                    style: AppCourseTextStyle.kCallOutLabelStyle
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Forget password ?',
                        style: AppCourseTextStyle.kLoginInputTextStyle.copyWith(
                            color: const Color(0xFF1B1E9C).withOpacity(0.5),
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
