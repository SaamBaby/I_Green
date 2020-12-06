import 'file:///C:/Users/SamBaby/georgian/Productive_Dev/android/i_green/lib/Pages/introduction/notConnected.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pages/introduction/OnBoard.dart';
import 'Pages/introduction/Splash.dart';
import 'Utils/theme.dart';


void main ()  async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith( statusBarBrightness: Brightness.dark,statusBarColor: Colors.white));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new IGreen());
  });
}

// Portraitmode mixin  is to force the app to be on portrait mode if the orientation is not in portrait
class IGreen extends StatelessWidget with PortraitModeMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
        title: 'I Green',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: Splash(),
        routes: {
          'onBoard':(context)  => onBoard(),
          'notConnected':(context)  => notConnected()
        },
      );

  }
}

class PortraitModeMixin {

}




