import 'package:Quete/models/User.dart';
import 'package:Quete/models/user/user.hive.model.dart';
import 'package:Quete/services/firebase/firebase.user.services.dart';
import 'package:Quete/services/graphql/user.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:Quete/graphql/schema.dart';
import 'package:flutter/foundation.dart';
import 'package:Quete/services/graphql/client.graphql.service.dart';
import 'package:Quete/services/cache/user.cache.service.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  UserService _meService= UserService();
  FirebaseAuth _auth;
  User _user;

  Status get status => _status;

  User get user => _user;
  Status _status = Status.Uninitialized;
  String firebaseUuid;
  String errorMessage;

  AuthProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(onStateChanged);
  }

  Future<void> onStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Uninitialized;
      notifyListeners();
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
      firebaseUuid=_user.uid;
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
  Future<String> signIn(String emailAddress, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((result) async {
        _status = Status.Authenticating;
        _user=result.user;
        UserCacheService.user =UserHive(id: _user.uid,email: _user.email, displayName: _user.displayName);
        onStateChanged(result.user);
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return (e.toString());
    }
  }

  // ignore: missing_return
  Future<String> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((result) async {
        _status = Status.Authenticating;
        await _auth.signInWithEmailAndPassword(email: email, password:password).then((value) async{
          _user = value.user;
          onStateChanged(value.user);
          UserCacheService.user =UserHive(id: firebaseUuid,email: email.toString());
          print("testing email${UserCacheService.user.email}");
          final _userInput = UsersInsertInput(
              userId: _user.uid,
              emailAddress: email.toString()
          );
          _meService.createUser( _userInput, graphQLClient: await
          IgreenGraphQLClient.getClient(),);

        });
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return (e.toString());
    }
  }

  Future<void> updateUser( UsersSetInput user) async {
    _meService.updateUser(user,graphQLClient: await IgreenGraphQLClient.getClient());
    notifyListeners();
  }
}
