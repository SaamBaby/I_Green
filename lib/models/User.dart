import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String firstName;
  String lastName;
  int phoneNumber;
  String address;
  String email;
  String id;
  String password;

  UserModel(
      {this.firstName,
      this.lastName,
      this.password,
      this.phoneNumber,
      this.address,
      this.email,
      this.id});

//// getters
//  String get name =>_name;
//  String get email=>_email;
//  String get id =>_id;

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json["firstName"];
    lastName = json["lastName"];
    email = json["email"];
    id = json["userId"];
    phoneNumber = json["phoneNumber"];
    address = json["address"];
  }
}
