import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:programming_course/core/components/snack_bar.dart';
import 'package:programming_course/features/authentication/repos/sing_up.dart';

import 'package:programming_course/utils/constants/colors.dart';
import 'package:programming_course/utils/constants/enums.dart';

import '../../bloc/auth_bloc.dart';
import '../widget/form_sign_up/form_sign_up.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  SignUpRepository get editController {
    return context.read<SignUpRepository>();
  }

  @override
  void dispose() {
    super.dispose();
    editController.nameOfUser.dispose();
    editController.email.dispose();
    editController.phoneNumber.dispose();
    editController.street.dispose();
    editController.postCode.dispose();
    editController.country.dispose();
    editController.city.dispose();
    editController.dateOfBirth.dispose();
    editController.password.dispose();
    editController.confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showSuccessSnackBar(context,
              msg: 'The Account has been Created Successfully',
              title: 'SignUp');
          context.goNamed('Home');
        }
        if (state is AuthErrorState) {
          showErrorSnackBar(context,
              msg: state.errorMessage, title: 'Oh! snap');
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/lightWall.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: AppDefineColors.kLinerBackground,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF5E636B).withOpacity(0.1),
                            offset: const Offset(0, 15),
                            blurRadius: 30),
                        BoxShadow(
                            color: const Color(0xFF5E636B).withOpacity(0.15),
                            offset: const Offset(0, 15),
                            blurRadius: 40)
                      ]),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is ValidateStatusState) {
                        return SizedBox(
                          width: 320,
                          height: state.validateStatus == ValidateStatus.invalid
                              ? 600
                              : state.validateStatus == ValidateStatus.validate
                                  ? 522
                                  : 522,
                          child: FormSignUp(
                            editController: editController,
                          ),
                        );
                      }
                      return SizedBox(
                        width: 320,
                        height: 500,
                        child: FormSignUp(
                          editController: editController,
                        ),
                      );
                    },
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
