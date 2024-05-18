import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:programming_course/features/authentication/model/address.dart';

class UserModel {
  UserModel(
      {this.id = '',
      this.fullName = '',
      required this.email,
      required this.address,
      this.phoneNumber = '',
      required this.dateBirth,
      this.profilePic});

  String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final AddressModel address;

  final DateTime dateBirth;
  final String? profilePic;

  static UserModel empty() => UserModel(
      email: '', address: AddressModel.empty(), dateBirth: DateTime.now());

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          fullName: data['fullName'],
          email: data['email'],
          address: AddressModel.fromJson(data['address']),
          dateBirth: DateFormat('yyyy-mm-dd').parse(data['dateBirth']),
          phoneNumber: data['phoneNumber'],
          profilePic: data['profilePic'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
  factory UserModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    return UserModel(
        fullName: data['fullName'],
        email: data['email'],
        address: AddressModel.fromJson(data['address']),
        dateBirth: DateFormat('yyyy-mm-dd').parse(data['dateBirth']),
        phoneNumber: data['phoneNumber'],
        profilePic: data['profilePic'] ?? '');
  }

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "address": address.toJson(),
        "phoneNumber": phoneNumber,
        "dateBirth": dateBirth.toString(),
        "profilePic": profilePic
      };
}
