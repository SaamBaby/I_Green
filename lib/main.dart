import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'file:///C:/Users/SamBaby/georgian/Productive_Dev/android/i_green/lib/Pages/introduction/notConnected.dart';

import 'Pages/introduction/OnBoard.dart';
import 'Pages/introduction/Splash.dart';
import 'Pages/root.dart';
import 'Utils/theme.dart';

Widget _initialRoute;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.dark, statusBarColor: Colors.white));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();

    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        _initialRoute = Splash();
      } else {
        _initialRoute = Root();
      }
    });

    runApp(new IGreen());
  });
}

// Portraitmode mixin  is to force the app to be on portrait mode if the orientation is not in portrait
class IGreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I Green',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: _initialRoute,
      routes: {
        'onBoard': (context) => onBoard(),
        'notConnected': (context) => notConnected()
      },
    );
  }
}
