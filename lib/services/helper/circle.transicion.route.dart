import 'package:Quete/Utils/Widgets/circle.transicion.clipper.dart';
import 'package:flutter/material.dart';

class CircleTransicionRoute extends PageRouteBuilder {
  final Widget page;
  final RouteSettings settings;
  CircleTransicionRoute( {this.settings,this.page})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,) => page,
    settings: settings,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 1000),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
  Animation<double> secondaryAnimation, Widget child,) {
      var screenSize =MediaQuery.of(context).size;
      double beginRadius =0.0;
      double endRadius = screenSize.height*1.2;
      var  centerCircleClipper = Offset(screenSize.width/2, screenSize.height/2);

       var radiusTween = Tween(begin: beginRadius, end: endRadius);
       var radiusTweenAnimation = animation.drive(radiusTween);
       return ClipPath(
        child: child,
        clipper: CirlceTransitionClipper(
          center: centerCircleClipper,
          radius: radiusTweenAnimation.value
        ),
       );
    }



  );
}

class NoTransicionRoute extends PageRouteBuilder {
  final Widget page;
  final RouteSettings settings;
  NoTransicionRoute( {this.settings,this.page})
      : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation,) => page,
    settings: settings,
  );
}