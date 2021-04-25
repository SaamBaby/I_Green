import 'package:Quete/Pages/schedule/schedule.addHours.screen.dart';
import 'package:Quete/models/Job.dart';
import 'package:Quete/Pages/auth/login.screen.dart';
import 'package:Quete/providers/appliedJobs_provider.dart';
import 'package:Quete/providers/jobs_provider.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:Quete/services/graphql/client.graphql.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:provider/provider.dart';

import 'Pages/home/home.job.details.dart';
import 'Pages/introduction/onBoard.screen.dart';
import 'Pages/introduction/splash.screen.dart';
import 'Pages/introduction/notConnected.screen.dart';
import 'Pages/root.page.dart';
import 'Routes.dart';
import 'Utils/session.service.dart';
import 'Utils/theme.dart';
import 'providers/schedule.shifts.provider.dart';
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.dark, statusBarColor: Colors.white));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();



    runApp(
        MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => AuthProvider.initialize()),
      ChangeNotifierProxyProvider<AuthProvider,Jobs>(
        update: (context,auth,previousState) => Jobs(auth.idToken,previousState==null?{}:previousState.items),
      ),
      ChangeNotifierProxyProvider<AuthProvider,JobModel>(
        update: (context, auth,_)=>JobModel(authToken: auth.idToken),
      ),
      ChangeNotifierProxyProvider<AuthProvider,ShiftProvider>(
        update: (context,auth,previousState) => ShiftProvider(auth.idToken, auth.firebaseUuid,previousState==null?{}:previousState.items),
      ),
      ChangeNotifierProxyProvider<AuthProvider,AppliedJobs>(
        update: (context,auth,previousState) => AppliedJobs(auth.idToken, auth.firebaseUuid,previousState==null?{}:previousState.items),
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
    return Consumer<AuthProvider>( builder: (context,auth,_)=>
        ScreenUtilInit(
            designSize: Size(360, 690),
            builder: () =>MaterialApp(
              title: 'I Green',
              debugShowCheckedModeBanner: false,
              theme: theme(),
              builder: (context, widget) {
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget,
                );
              },
              home: ScreensController(),
              onGenerateRoute: (routeSettings) => Routes.generateRoute
                (routeSettings, root: ScreensController(),isCustomTransicion: true),
    )
        ));
  }
}
class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context)  {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
        return Login();
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        {
          final gqlClient = IgreenGraphQLClient.getClient();
          print(gqlClient);
          return Root();
        }

    }
    return null;
  }
}