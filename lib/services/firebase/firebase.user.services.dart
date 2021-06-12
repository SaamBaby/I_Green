import 'package:Quete/graphql/schema.graphql.dart';
import 'package:Quete/services/cache/user.cache.service.dart';
import 'package:Quete/services/graphql/user.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
class FirebaseUserServices{

  static var  fireStoreUserInstance = FirebaseFirestore.instance.collection('users').doc(UserCacheService.user.id);
  static var  storageUserInstance= FirebaseStorage.instance;
  static  UserService userService;

  static void createUserProfile(UsersSetInput user){
    fireStoreUserInstance.set(user.toJson());
  }

  static void updateProfilePic(File imgFile)async{
    String userProfileUrl;
    var ref =storageUserInstance.ref().child('UserProfile').child(UserCacheService.user.id+'.jpg');

    // getting the storage upload task
    await ref.putFile(imgFile).then((value) async {
      userProfileUrl= await value.ref.getDownloadURL();
      print(value.state.toString());
    });
    UserService()..updateUserProfile(userProfileUrl);
  }
}