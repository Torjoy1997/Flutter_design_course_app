import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context,
        {String? title, required String msg}) =>
    Flushbar(
      icon: const Icon(
        Icons.error,
        color: Colors.white,
        size: 32,
      ),
      title: title,
      message: msg,
      borderRadius: BorderRadius.circular(16),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.fromLTRB(8, kToolbarHeight, 8, 0),
      padding: const EdgeInsets.all(24),
      flushbarPosition: FlushbarPosition.TOP,
      barBlur: 20,
      backgroundColor: Colors.redAccent.shade400,
    )..show(context);

void showSuccessSnackBar(BuildContext context,
        {String? title, required String msg}) =>
    Flushbar(
      icon: const Icon(
        Icons.check_circle,
        color: Colors.white,
        size: 32,
      ),
      title: title,
      message: msg,
      borderRadius: BorderRadius.circular(16),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.fromLTRB(8, kToolbarHeight, 8, 0),
      padding: const EdgeInsets.all(24),
      flushbarPosition: FlushbarPosition.TOP,
      barBlur: 20,
      backgroundColor: Colors.green.shade500,
    )..show(context);
