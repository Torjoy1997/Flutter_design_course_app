import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:firebase_authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:programming_course/features/authentication/model/address.dart';

import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../model/user.dart';

class SignUpRepository {
  final _db = FirebaseFirestore.instance.collection('Users');
  final _auth = AuthRepository();

  final nameOfUser = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postCode = TextEditingController();
  final city = TextEditingController();

  final country = TextEditingController();
  final dateOfBirth = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  Future<void> saveUserRecord() async {
    try {
      final user = submitUserForm();
      final userCredential =
          await _auth.registerWithEmailAndPassword(user.email, password.text);

      await _db.doc(userCredential.user!.uid).set(user.toJson());
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  UserModel submitUserForm() {
    return UserModel(
      fullName: nameOfUser.text.trim(),
      email: email.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      address: AddressModel(
          city: city.text.trim(),
          street: street.text.trim(),
          country: country.text.trim(),
          postCode: postCode.text.trim()),
      dateBirth: DateFormat("yyyy-MM-dd").parse(dateOfBirth.text.trim()),
    );
  }

  Future<void> selectDate(
      BuildContext context, Function(String) setDate) async {
    DateTime? picker = await showDatePickerDialog(
      context: context,
      maxDate: DateTime(2010, 01, 01),
      minDate: DateTime(1980, 01, 01),
      currentDate: DateTime(2010, 01, 01),
    );

    if (picker != null) {
      setDate(picker.toString().split(" ")[0]);
    }
  }
}
