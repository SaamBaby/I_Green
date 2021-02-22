import 'package:Quete/Pages/schedule/AddHours.dart';
import 'package:Quete/models/Job.dart';
import 'package:Quete/Pages/auth/Login.dart';
import 'package:Quete/providers/appliedJobs_provider.dart';
import 'package:Quete/providers/jobs_provider.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:Quete/providers/shifts.schedule.provider.dart';
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
import 'Utils/session.service.dart';
import 'Utils/theme.dart';


void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.dark, statusBarColor: Colors.white));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();



    runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => AuthProvider.initialize()),
      ChangeNotifierProxyProvider<AuthProvider,Jobs>(
        update: (context,auth,previousState) => Jobs(auth.idToken,previousState==null?{}:previousState.items),
      ),
      ChangeNotifierProvider(
        create: (context,) =>  JobModel(),
      ),
      ChangeNotifierProxyProvider<AuthProvider,ShiftProvider>(
        update: (context,auth,previousState) => ShiftProvider(auth.idToken,previousState==null?{}:previousState.items),
      ),
      ChangeNotifierProxyProvider<AuthProvider,AppliedJobs>(
        update: (context,auth,previousState) => AppliedJobs(auth.idToken,previousState==null?{}:previousState.items),
      ),
      ChangeNotifierProvider(
        create: (context) => SessionService(),
      ),


    ], child: new IGreen()));
  });
}

class IGreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>( builder: (context,auth,_)=>MaterialApp(
      title: 'I Green',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: ScreensController(),
      routes: {
        onBoard.routName: (context) => onBoard(),
        JobDetails.routName: (context) => JobDetails(),
        NotConnected.routName: (context) => NotConnected(),
        AddHours.routName:(context)=> AddHours()

//        'notConnected': (context) => NotConnected()
      },
    ));
  }
}
class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return Root();

    }
  }
}