import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import '../../Routes.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  void startTimer() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    Timer( Duration( seconds: 2), (){
      if(connectivityResult == ConnectivityResult.mobile||connectivityResult == ConnectivityResult.wifi){
       print("Connected to Mobile Networks");
       Navigator.pushNamed(context, Routes.onBoard);
      }
      else{
        print("Not connected to Mobile Networks");
        Navigator.pushNamed(context, Routes.notConnected);}
    });
  }

  @override


  void initState() {

    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child:
        Image.asset('assets/images/introduction/gLogo.png', width: MediaQuery.of(context).size.width*.25, height: MediaQuery.of(context).size.height*.25,),
      )

    );
  }
}



