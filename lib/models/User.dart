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



}
