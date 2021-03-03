import 'package:Quete/models/User.dart';
import 'package:Quete/services/Firebase_helper/firebase.user.services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  FirebaseAuth _auth;
  User _user;
  UserModel _userModel;
  String _idToken;

//  getter
  UserModel get userModel => _userModel;

  Status get status => _status;

  String get idToken => _idToken;

  User get user => _user;
  UserServices _userServices = UserServices();
  Status _status = Status.Uninitialized;
  String firebaseUuid;
  String errorMessage;

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(onStateChanged);
  }

  Future<void> onStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Uninitialized;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;

      await _user.getIdToken(true).then((value) {
        _idToken = value;
      });
    }
    notifyListeners();
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  // ignore: missing_return
  Future<String> signIn(UserModel user) async {
    try {
      notifyListeners();
      await _auth
          .signInWithEmailAndPassword(
              email: user.email, password: user.password)
          .then((result) async {
        _user = result.user;
        _status = Status.Authenticating;
        firebaseUuid = result.user.uid;
        onStateChanged(result.user);
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return (e.toString());
    }
  }

  Future<String> signUp(UserModel user) async {
    try {
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(
              email: user.email, password: user.password)
          .then((result) {
        firebaseUuid = result.user.uid;
        _status = Status.Authenticating;
        onStateChanged(result.user);
        _userServices.createUser(user.email, firebaseUuid);
        notifyListeners();
        return firebaseUuid;
      });
    } on FirebaseAuthException catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return (e.toString());
    }
    return firebaseUuid;
  }

  Future<void> updateUser(UserModel user) async {
    Map<String, dynamic> values = {
      "First_Name": user.firstName,
      "Last_Name": user.lastName,
      "Phone_Number": user.phoneNumber,
      "Address": user.address
    };
    print(" UserId$firebaseUuid");
    _userServices.updateUser(values, firebaseUuid);
  }
}
