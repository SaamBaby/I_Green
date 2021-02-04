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

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    firstName = snapshot.data()["firstName"];
    lastName = snapshot.data()["lastName"];
    email = snapshot.data()["email"];
    id = snapshot.data()["userId"];
    phoneNumber = snapshot.data()["phoneNumber"];
    address = snapshot.data()["address"];
  }
}
