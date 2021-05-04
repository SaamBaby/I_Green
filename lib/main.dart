
import 'package:Quete/models/Job.dart';
import 'package:Quete/Pages/auth/login.screen.dart';
import 'package:Quete/providers/appliedJobs_provider.dart';
import 'package:Quete/providers/jobs_provider.dart';
import 'package:Quete/providers/auth_provider.dart';
import 'package:Quete/services/graphql/client.graphql.service.dart';
import 'package:Quete/services/graphql/discovery.service.dart';
import 'package:Quete/services/graphql/user.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:provider/provider.dart';
import 'Pages/introduction/splash.screen.dart';
import 'Pages/root.page.dart';
import 'Routes.dart';
import 'Utils/session.service.dart';
import 'Utils/theme.dart';
import 'models/user/user.hive.model.dart';
import 'providers/schedule.shifts.provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';



final _userService= UserService();
final _discoveryService= DiscoveryService()..getShifts();
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.dark, statusBarColor: Colors.white));
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp();
   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then
     ((_) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Hive.initFlutter();
    Hive.registerAdapter<UserHive>(UserHiveAdapter());
    await Hive.openBox<UserHive>('user');

    runApp(
        MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => AuthProvider.initialize()),
        ChangeNotifierProvider.value(
          value:  _userService),
          ChangeNotifierProvider.value(
          value: _discoveryService),

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
  void initGraphql()async{
    final gqlClient = await IgreenGraphQLClient.getClient();
    await _userService.init(gqlClient, shouldGetUser: true);
  }
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
          initGraphql();
          return Root();
        }

    }
    return null;
  }
}