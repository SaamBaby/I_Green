import 'package:Quete/models/Job.dart';
import 'package:Quete/providers/appliedJobs_provider.dart';
import 'package:Quete/providers/jobs_provider.dart';
import 'package:Quete/providers/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Pages/home/JobDetails.dart';
import 'Pages/introduction/OnBoard.dart';
import 'Pages/introduction/Splash.dart';
import 'Pages/introduction/notConnected.dart';
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

    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => UserProvider.initialize()),
      ChangeNotifierProvider(
        create: (context) => Jobs(),
      ),
      ChangeNotifierProvider(
        create: (context) => JobModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppliedJobs(),
      ),


    ], child: new IGreen()));
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
        onBoard.routName: (context) => onBoard(),
        JobDetails.routName: (context) => JobDetails(),
        NotConnected.routName: (context) => NotConnected()

//        'notConnected': (context) => NotConnected()
      },
    );
  }
}
