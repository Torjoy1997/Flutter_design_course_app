import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  final String street;
  final String postCode;
  final String city, country;

  AddressModel(
      {required this.street,
      this.postCode = '',
      required this.city,
      required this.country});

  static AddressModel empty() =>
      AddressModel(street: '', city: '', country: '');

  Map<String, dynamic> toJson() => {
        "street": street,
        "postCode": postCode,
        "city": city,
        "country": country
      };

  factory AddressModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return AddressModel(
          street: data['street'],
          postCode: data['postCode'],
          city: data['city'],
          country: data['country']);
    }
    return AddressModel.empty();
  }

  factory AddressModel.fromJson(
      Map<String,dynamic > data) {

    return AddressModel(
        street: data['street'],
        postCode: data['postCode'],
        city: data['city'],
        country: data['country']);
  }
}
